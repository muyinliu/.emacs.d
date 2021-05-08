# Emacs configuration for Common Lisp/Clojure users

## Install

```shell
cd ~/
git clone --recursive https://github.com/muyinliu/.emacs.d.git
```

OR

```shell
cd ~/
git clone https://github.com/muyinliu/.emacs.d.git
cd ~/.emacs.d/
git submodule init
git submodule update
```

### Note for Aquamacs users

link `~/.emacs.d` as Aquamacs' config with commands:

```shell
mv ~/Library/Preferences/Aquamacs\ Emacs/Packages ~/Library/Preferences/Aquamacs\ Emacs/Packages.bak
ln -s ~/.emacs.d ~/Library/Preferences/Aquamacs\ Emacs/Packages
mv ~/Library/Preferences/Aquamacs\ Emacs/Preferences.el ~/Library/Preferences/Aquamacs\ Emacs/Preferences.el.bak
ln -s ~/.emacs.d/init.el ~/Library/Preferences/Aquamacs\ Emacs/Preferences.el
```

### Note for SLIME(Common Lisp)

If you want to use [SLIME](https://github.com/slime/slime), the Superior Common Lisp Interaction Mode for Emacs, you have to install follow dependencies:

* Common Lisp Implementation, eg. [SBCL](http://www.sbcl.org)/[CCL](https://ccl.clozure.com)/[ECL](https://common-lisp.net/project/ecl/)/...
* [QuickLisp](http://www.quicklisp.org)
* [SLIME](https://github.com/slime/slime) installed with `(ql:quickload 'swank)` in Common Lisp REPL

Run `slime` on Emacs will run SLIME REPL

Note: without `slime` installed will get a `Cannot open load file: No such file or directory, slime` when execute command `slime`

### Note for CIDER(Clojure)

If you want to use [CIDER](https://github.com/clojure-emacs/cider), the Clojure Interactive Development Environment that Rocks for Emacs, you have to have [Leiningen](https://leiningen.org) or [Boot](http://boot-clj.com) installed, and please take a look at [Launch an nREPL server and client from Emacs](https://github.com/clojure-emacs/cider#launch-an-nrepl-server-and-client-from-emacs) and [Connect to a running nREPL server](https://github.com/clojure-emacs/cider#connect-to-a-running-nrepl-server)

## Plugins

Plugins included in configuration:

* [use-package](https://github.com/jwiegley/use-package) Lazy load plugins
* [expand-region.el](https://github.com/magnars/expand-region.el) Select code easily
* [multiple-cursors.el](https://github.com/magnars/multiple-cursors.el) Select part of multiple lines
* [company-mode](https://github.com/company-mode/company-mode) Auto complete
* [slime-company](https://github.com/anwyn/slime-company) Auto complete in Common Lisp mode and SLIME REPL
* [slime-repl-ansi-color](https://github.com/deadtrickster/slime-repl-ansi-color) Show with ANSI color in SLIME REPL
* [visual-regexp](https://github.com/benma/visual-regexp.el) Search words in visual mode
* [visual-regexp-steroids](https://github.com/muyinliu/visual-regexp-steroids.el) Search words in visual mode with Python regex
* [dash](https://github.com/magnars/dash.el) parinfer-mode's dependency
* [move-lines](https://github.com/targzeta/move-lines) Move lines easily
* [duplicate-thing](https://github.com/ongaeshi/duplicate-thing) Duplicate line or other things
* [smartparens](https://github.com/Fuco1/smartparens) Auto complete brackets
* [parinfer-mode](https://github.com/DogLooksGood/parinfer-mode) Auto indent and complete brackets
* [rainbow-delimiters](https://github.com/Fanael/rainbow-delimiters) Show brackets with colors in different level
* [auto-highlight-symbol](https://github.com/gennad/auto-highlight-symbol) Highlight same symbol
* [rainbow-mode](https://github.com/emacsmirror/rainbow-mode) Highlight color hex code with background color
* [tabbar](https://github.com/dholm/tabbar) Tabbar fork from Aquamacs
* [buffer-move](https://github.com/lukhas/buffer-move) Move buffer from window to window
* [nyan-mode](https://github.com/TeMPOraL/nyan-mode) Show progress bar with a cute nyan cat
* [imenu-anywhere](https://github.com/vspinu/imenu-anywhere) Show function/symbol or other things in a list
* [helm](https://github.com/emacs-helm/helm) Visual select before execute command or find files or grep(ag) files
* [emacs-async](https://github.com/jwiegley/emacs-async) Dependency of helm
* [browse-url-dwim](https://github.com/rolandwalker/browse-url-dwim) Browse URL on current cursor in Safari(only for Mac OS)
* [osx-browse](https://github.com/rolandwalker/osx-browse) Web browsing helpers for Emacs on OS X
* [org-bullets](https://github.com/sabof/org-bullets) Show title prefix with specific character in different level
* [cnfonts](https://github.com/tumashu/cnfonts) Show chinese with same-width fonts(1 chinese character take up space of 2 english character)
* [nlinum](https://github.com/emacsmirror/nlinum) Show line numbers in the margin
* [clojure-mode](https://github.com/clojure-emacs/clojure-mode) Emacs support for the Clojure(Script) programming language
* [spinner.el](https://github.com/Malabarba/spinner.el) Emacs mode-line spinner for operations in progress
* [CIDER](https://github.com/clojure-emacs/cider) The Clojure Interactive Development Environment that Rocks for Emacs
* [queue](https://github.com/emacsmirror/queue) Queue data structure
* [markdown-mode](https://github.com/jrblevin/markdown-mode) Emacs Markdown Mode
* [parseedn](https://github.com/clojure-emacs/parseedn) EDN parser for Emacs Lisp
* [pkg-info](https://github.com/emacsorphanage/pkg-info) Provide information about Emacs packages
* [sesman](https://github.com/vspinu/sesman) Session manager for Emacs based IDEs
* [a](https://github.com/plexus/a.el) Emacs Lisp functions for dealing with association lists and hash tables. Inspired by Clojure
* [parseclj](https://github.com/clojure-emacs/parseclj) Clojure Parser for Emacs Lisp
