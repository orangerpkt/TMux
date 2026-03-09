- [Repository Description](#repository-description)
    - [Basis](#basis)
    - [Keybindings](#keybindings)
    - [Copy and Paste](#copy-and-paste)

# TMux <a id="repository-description"></a>

<div style="display: inline-flex; flex-direction: row; justify-content: center; align-items: center; width: 100%;">
    <img src="./logo.jpg" style="width: 100%;"/>
</div>

TMux stands for **Terminal Multiplexer**. It is an open-source project for Unix-based operating system. 
A full description of the project can be found [here](https://en.wikipedia.org/wiki/Tmux). 
This repository contains the following data:

* [`.tmux.conf`](./.tmux.conf) is the main configuration file.
* [`install.sh`](./install.sh) is a script to install automatically TMux on your machine.

Other files are useless more or less.

## Session, Tab and Basic Commands <a id="basis"></a>

Nowadays, TMux is based on two concepts: **session** and **tab**. A session can contain multiple tab, and works in a 
single process. A tab is a single instance of the terminal.

First of all, you can check the active session, using the command: `tmux ls`. A list of active sessions will be shown.
In case of no session is active, the following message will be shown:

```sh
no server running on /tmp/tmux-1000/default
```

To create a new session of tmux, just use the command `tmux`. A new session will be created, with a top-bar containing 
the IP address of the current machine; the list of active tabs (in case of new session, a single tab is created with 
id 1); finally, the current timestamp.

The current session will remain active, despite anomalous exit, or no explicit `exit` command. If you close and 
re-open your terminal, and type `tmux ls`, you will see the info about the previous session just created:

```
0: 1 windows (created Thu Feb 26 11:20:14 2026)
```

As you can see, for each session, the following information are shown: id of the session (0); number of open tab; 
creation timestamp. 

To connect to an active session, you can use the following command:

```sh
tmux attach -t <session-id>
```

To detach from the current session, you can use the command `<Ctrl-d>` or type `tmux detach`. Closing all the active 
tabs, or typing `<Ctrl-X>` will kill the current session.

Moreover, there are two different ways to kill a TMux session:

1. Close all the active windows, using the command `exit`;
2. Use the following command 

```sh
tmux kill-session -t <session-id>
```


## Keybindings <a id="keybindings"></a> 

I prepared a set of commands to be used in this customization. Any updates to this set of combinations, can be done 
in the [.tmux.conf](.tmux.conf) file:

* `<Ctrl-s>` + `c` attach a new tab to the current session.
* `Shift` + left or right arrow to navigate through your tabs.
* `Ctrl` + `x` kills the current pane.
* `Ctrl` + `R` rename the current tab.
* `Ctrl` + `r` reload the configuration.
* `Ctrl` + `h` splits horizontally the current tab.
* `Ctrl` + `v` splits vertically the current tab.
* `Alt` + left or right arrow able to navigate through different terminal in the current tab.

## Copy and Paste <a id="copy-and-paste"></a>

This TMux configuration allows to use copy-and-paste in combination with the mouse. To copy and paste something
displayed on your terminal, select the text with your mouse and type `y` (y stands for Yank, just like Vim). Then, you
can paste the selected text using the combination `<Ctrl-s-v>`.

I strongly encourage to use NeoVim in combination with TMux, since these operations are made easily using the default
NeoVim combinations.
