;; This package wraps several mpc commands in order to make it easy to use mpd from emacs.
;; Copyright (C) 2023 Carson Holscher


;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(defun mpc-clear ()
  "Clears your mpd cache."
  (interactive)
  (shell-command "mpc clear"))

(defun mpc-play ()
  "Plays your mpd playlist"
  (interactive)
  (shell-command "mpc play"))

(defun mpc-stop ()
  "Stops playing current song"
  (interactive)
  (shell-command "mpc stop"))

;;Known issue: Does not remove the empty string at the end
(defun mpc-ls ()
  "Lists your all songs. Returns a list"
  (remove "" (split-string (shell-command-to-string "mpc ls") "\n")))

(defun mpc-next ()
  "Starts playing the next song in your queue."
  (interactive)
  (shell-command "mpc next"))

(defun mpc-prev ()
  "Starts playing the previous song in your queue."
  (interactive)
  (shell-command "mpc prev"))

(defun mpc-add (file)
  "Add FILE to the queue. FILE is a string."
  (shell-command (concat "mpc add " "\"" file "\"")))

(defun mpc-insert (file)
  "Add FILE to the queue after the currently playing song. FILE is a string."
  (shell-command (concat "mpc insert " file)))

(defun mpc-crop ()
  "Remove all songs except for the currently playing song."
  (interactive)
  (shell-command "mpc crop"))

(defun mpc-pause ()
  "Pauses playing."
  (interactive)
  (shell-command "mpc pause"))

(defun mpc-random ()
  "Toggles mpd's random state."
  (interactive)
  (shell-command "mpc random"))

(defun mpc-del (num)
  "Removes item NUM from the queue."
  (shell-command (concat "mpc del " (number-to-string num))))

(defun mpc-shuffle ()
  "Shuffles all songs on the queue."
  (interactive)
  (shell-command "mpc shuffle"))

(defun mpc-repeat ()
  "Toggles mpd's repeat state."
  (interactive)
  (shell-command "mpc repeat"))

(defun mpc-toggle ()
  "Toggles between play & pause. If stopped, starts playing."
  (interactive)
  (shell-command "mpc toggle"))

(defun mpc-update ()
  "Updates the mpc playlist"
  (interactive)
  (shell-command "mpc update"))

(provide 'mpc-wrapper)
