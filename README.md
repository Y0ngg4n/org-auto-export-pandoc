---
---

# org-auto-export-pandoc

This package provides the functionality to automatically export with
org-pandoc-export-\* modes. It adds a hook to exute it when you save the
file. It will look for the following tag:

``` elisp
#+auto-export-pandoc: to-markdown
```

You can add the tag muliple times to export to multiple formats:

``` elisp
#+auto-export-pandoc: to-markdown
#+auto-export-pandoc: to-latex-pdf
#+auto-export-pandoc: to-html5
```

You should also be able set pandoc export parameters as described here:
<https://github.com/kawabata/ox-pandoc>
