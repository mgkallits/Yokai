Yes, you can modify the `hyprland/submap` module in Waybar to display custom tooltips. Since Waybar is open-source, you can edit the source code of the `submap` module to add custom tooltip functionality. Here's how you can do it:

---

### Step 1: Clone the Waybar Repository

First, clone the Waybar repository to your local machine if you haven't already:

```bash
git clone https://github.com/Alexays/Waybar.git
cd Waybar
```

---

### Step 2: Modify the `submap` Module

The `submap` module is located in `src/modules/hyprland/submap.cpp`. You need to modify this file to add custom tooltip functionality.

#### Key Changes to Make:
1. **Add a Configuration Option for Custom Tooltips**:
   - Add a `Json::Value` parameter to the `Submap` class to store custom tooltips.

2. **Update the `update` Method**:
   - Modify the `update` method to set custom tooltips based on the current submap.

3. **Parse Custom Tooltips from the Configuration**:
   - Add logic to parse custom tooltips from the Waybar configuration file.

---

### Step 3: Edit `submap.cpp`

Here’s an example of how you can modify `submap.cpp`:

#### Add Custom Tooltips to the Configuration:
In the `parseConfig` method, add support for a `tooltips` configuration option:

```cpp
auto Submap::parseConfig(const Json::Value& config) -> void {
    auto const& alwaysOn = config["always-on"];
    if (alwaysOn.isBool()) {
        always_on_ = alwaysOn.asBool();
    }

    auto const& defaultSubmap = config["default-submap"];
    if (defaultSubmap.isString()) {
        default_submap_ = defaultSubmap.asString();
    }

    // Parse custom tooltips
    auto const& tooltips = config["tooltips"];
    if (tooltips.isObject()) {
        for (const auto& key : tooltips.getMemberNames()) {
            tooltips_[key] = tooltips[key].asString();
        }
    }
}
```

#### Update the `update` Method:
Modify the `update` method to use custom tooltips:

```cpp
auto Submap::update() -> void {
    std::lock_guard<std::mutex> lg(mutex_);

    if (submap_.empty()) {
        event_box_.hide();
    } else {
        label_.set_markup(fmt::format(fmt::runtime(format_), submap_));
        if (tooltipEnabled()) {
            // Use custom tooltip if defined, otherwise use the submap name
            auto it = tooltips_.find(submap_);
            std::string tooltipText = (it != tooltips_.end()) ? it->second : submap_;
            label_.set_tooltip_text(tooltipText);
        }
        event_box_.show();
    }
    // Call parent update
    ALabel::update();
}
```

#### Add a Member Variable for Tooltips:
Add a `std::map` to store custom tooltips in the `Submap` class:

```cpp
private:
    std::map<std::string, std::string> tooltips_;  // Map of submap names to tooltips
```

---

### Step 4: Rebuild Waybar

After making the changes, rebuild Waybar:

```bash
meson build
ninja -C build
sudo ninja -C build install
```

---

### Step 5: Update Your Waybar Configuration

Now you can define custom tooltips in your Waybar configuration file:

```json
"hyprland/submap": {
    "format": "s: <{}>",
    "tooltip": true,
    "tooltips": {
        "default": "This is the default submap.",
        "quick-launch": "You are in a custom submap. Use this for special keybindings!"
    },
    "always-on": true,
    "default-submap": "default"
}
```

---

### Step 6: Test the Changes

Restart Waybar and test the changes. The module should now display custom tooltips based on the current submap.

---

### Example Output

- If the current submap is `default`, the tooltip will display: `"This is the default submap."`
- If the current submap is `quick-launch`, the tooltip will display: `"You are in a custom submap. Use this for special keybindings!"`

---

### Benefits of This Approach

- **Efficient**: The tooltips are handled directly in the module, avoiding the overhead of external scripts.
- **Customizable**: You can define custom tooltips for any submap in the configuration file.
- **Maintainable**: The changes are integrated into the module, making it easier to maintain.

---

### Alternative: Use CSS for Tooltips

If you prefer not to modify the source code, you can use CSS to style the tooltips based on the submap. However, this approach is limited to visual styling and cannot dynamically change the tooltip text.

Example CSS:

```css
#submap.default {
    tooltip: "This is the default submap.";
}

#submap.quick-launch {
    tooltip: "You are in a custom submap. Use this for special keybindings!";
}
```

---

Let me know if you need further assistance!