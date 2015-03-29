# scroll-slight
---

Scroll GNU Emacs buffers slightly up or down. The number of lines to
scroll is defined by variable `scroll-slight-amount`.

If `scroll-slight-amount` is a number, that value will be used for
scrolling both up and down. The other valid value of
`scroll-slight-amount` is a cons, in which case the `car` is
interepreted as the number of lines to scroll up and the `cdr` is
taken to be the number of lines to scroll down.

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

The old fashioned way:

```lisp
(require 'scroll-slight)
(setq scroll-slight-amount (cons 5 3))
(global-set-key (kbd "C-.") 'scroll-slight-up)
(global-set-key (kbd "C-,") 'scroll-slight-down)
```
