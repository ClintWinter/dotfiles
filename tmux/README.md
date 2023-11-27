# Tmux Cheat sheet

Guide to using tmux well since I suck at it.

## Overview

The status bar at the bottom is showing your _session_. A session is a collection of pseudo terminals.
Each session has one or more _windows_.
A window takes up the entire screen and may be split into _panes_. Each of which is a separate pseudo terminal.
Tmux sessions may become detached for whatever reason, but you can reattach with `tmux attach`.

## Useful commands

The "prefix" key is `C-space` (ctrl + space). This is like the leader key in vim.

A script was added called `t` which will allow you to fuzzy find a directory, and open it as a named tmux session.

For example, in your terminal you can type `t` and then search for `dotfiles` and hit enter, and it will open a session called `dotfiles`.

This can also be done from within tmux with the command `Prefix F`.

You can open a new window in your session with `Prefix c`.

Use `Prefix space` to toggle between two windows.

You can rename your session with `Prefix $`.

Use `Prefix x` to kill a window.
