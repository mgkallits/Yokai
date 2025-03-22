User:

Im trying to configure doom emacs font. I know that it doesnt enables by default this :
/*text*/ to be bold and italic, but renders only the outer one with is the italic. I know there is the 'make-face-bold-italic function which makes the font FACE bold and italic if possible, but i dont know how to enable it to be used when I only surround text in both "/" and "*".

Response: 

To configure Doom Emacs to render text surrounded by both `/` and `*` as both bold and italic, you need to customize the font-lock settings for the relevant mode (e.g., `org-mode`, `markdown-mode`, or whatever mode you're working in). Here's how you can achieve this:

### Step 1: Define a Custom Face
First, define a custom face that combines bold and italic styles. Add this to your `config.el` file in Doom Emacs:

```elisp
(defface my/bold-italic-face
  '((t :inherit (bold italic)))
  "Face for text that is both bold and italic."
  :group 'my-faces)
```

### Step 2: Configure Font Lock Keywords
Next, you need to add a font-lock rule to apply this face to text surrounded by both `/` and `*`. This can be done by adding a custom font-lock keyword to the appropriate mode.

For example, if you're working in `org-mode`, you can add this to your `config.el`:

```elisp
(add-hook 'org-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\\/\\*\\([^*]+\\)\\*\\/" 1 'my/bold-italic-face prepend)))))
```

### Explanation:
- `\\/\\*\\([^*]+\\)\\*\\/` is a regular expression that matches text surrounded by `/*` and `*/`.
- `1` refers to the first captured group in the regex (the text inside the delimiters).
- `'my/bold-italic-face` is the face to apply to the matched text.
- `prepend` ensures that this rule is added before other font-lock rules.

### Step 3: Reload Your Configuration
After adding the above code to your `config.el`, reload your Doom Emacs configuration by running `M-x doom/reload` or restarting Emacs.

### Step 4: Test It
Now, when you type `/*some text*/` in your buffer, it should render as both bold and italic.

### Notes:
- If you're using a different mode (e.g., `markdown-mode`), replace `org-mode-hook` with the appropriate mode hook.
- If you want this to work globally across all modes, you can use `global-font-lock-mode` or add the font-lock keywords to `prog-mode-hook` or `text-mode-hook`.

This approach should give you the desired effect of rendering text surrounded by `/*` and `*/` as both bold and italic in Doom Emacs.
