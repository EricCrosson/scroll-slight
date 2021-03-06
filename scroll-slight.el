;;; scroll-slight.el --- Scroll the buffer slightly up or down
;; Version: 0.0.20140327

;; Copyright (C) 2015 Eric Crosson

;; Author: Eric Crosson <esc@ericcrosson.com>
;; Keywords: scroll
;; Package-Version: 0.1

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides commands for moving the buffer slightly up or
;; down without adjusting point.

;; Usage:

;; (global-set-key (kbd "C-.") 'scroll-slight-up)
;; (global-set-key (kbd "C-,") 'scroll-slight-down)

;;; Code

(defcustom scroll-slight-amount 6
  "The number of lines to shift in `scroll-slight-up' and
`scroll-slight-down'.

If `scroll-slight-amount' is an integerp, that integer is used
for both up and down scrolling. If `scroll-slight-amount' is a
cons, the car is used for the amount to scroll up and the cdr is
used for the amount to scroll down."
  :type    '(integer)
  :options '(5 6)
  :group   'scroll-slight)

(defun scroll-slight-up-amount ()
  "Determine the amount to scroll up in `scroll-slight-up'
based on the value of `scroll-slight-amount.' See the
documentation of `scroll-slight-amount' for more information."
  (if (consp scroll-slight-amount)
      (car scroll-slight-amount)
    scroll-slight-amount))

(defun scroll-slight-down-amount ()
  "Determine the amount to scroll down in `scroll-slight-down'
based on the value of `scroll-slight-amount.' See the
documentation of `scroll-slight-amount' for more information."
  (if (consp scroll-slight-amount)
      (cdr scroll-slight-amount)
    scroll-slight-amount))

(defun scroll-slight-scroll-fn (direction &optional n)
  "Scroll the buffer in DIRECTION the amount of lines specified
by `scroll-slight-amount' N times."
  (dotimes (i (or n 1))
    (cond ((eq direction :up) (scroll-up (scroll-slight-up-amount)))
	  ((eq direction :down) (scroll-down (scroll-slight-down-amount))))))

;;;###autoload
(defun scroll-slight-up (&optional n)
  "Scroll the buffer upwards by `scroll-slight-amount' N
times. This command does not move point."
  (interactive)
  (scroll-slight-scroll-fn :up n))

;;;###autoload
(defun scroll-slight-down (&optional n)
  "Scroll the buffer downwards by `scroll-slight-amount' N
times. This command does not move point."
  (interactive)
  (scroll-slight-scroll-fn :down n))

(provide 'scroll-slight)

;;; scroll-slight.el ends here
