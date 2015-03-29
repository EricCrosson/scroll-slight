# scroll-slight
---

Scroll GNU Emacs buffers slightly up or down. The number of lines to
scroll is defined by variable `scroll-slight-amount`.

## Installation

To install this package with
[quelpa](https://github.com/quelpa/quelpa), evaluate the following:

```lisp
(quelpa '(scroll-slight :fetcher github :repo "EricCrosson/scroll-slight"))
```

## Usage

Choose your favorite method below.

Via `use-package`:

```lisp
(use-package scroll-slight
	:bind
      ("C-." . scroll-slight-up)
      ("C-," . scroll-slight-down)
	:config
  	  (setq scroll-slight-amount 3))
```

Yeah, that's possible with bind but

The old fashioned way:

```lisp
(require 'scroll-slight)
(setq scroll-slight-amount 3)
(global-set-key (kbd "C-.") 'scroll-slight-up)
(global-set-key (kbd "C-,") 'scroll-slight-down)
```
