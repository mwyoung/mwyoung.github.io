---
layout: post
title: "Linux Troubleshooting"
date: 2020-06-30
---
<!-- file:///home/miles/Documents/Scripts/usefulCMDs -->
This page contains troubleshooting tips that have been used on a Linux based system
(Ubuntu). It is not guarenteed to work on all systems, and is mostly used to keep track of
successful commands used.

Another page with configuration files that is helpful is the [dotfiles page]({% link
_pages/dotfiles.md %}).

### Command Line Utilities

#### Renaming
One nice utility is [rename](https://www.commandlinux.com/man-page/man1/rename.1.html),
which can rename multiple files with a regex. One example of this is
`rename 's/old/new/' *.pdf`.

#### File size
One way to check file size using the terminal for folders is to use `ncdu`. This method
makes it easy to find files in folders that take up space, and can remove the files. An
alternate method is to use `find -type f -ls | sort -k 7 -r -n | head -10`.

#### Finding files
One tool to find files would be find. This can be used to find files with the command
`find . -name "file"`, where the dot (.) signifies the current directory.

One way this can be used is to find and remove .sw\* files (or other temporary compiler
files). The command `find . -type f -name "*.sw[klmnop]" -delete` removes all of the files
(from swk to swp). To remove files that macOS places, use the command
`find . -type f -name "._*" -delete`.

#### Fixing directories
Sometime permissions for a home directory could be broken, and need to be fixed. The
correct permissions for the home directory is usually 0755, for \~/.ssh is 0700, for files
0644, and for private directories is 0600. The commands to do this automatically instead
of using chmod xxxx is:

`find /path/home -type d -print0 | xargs -0 chmod 0775
find /path/home -type f -print0 | xargs -0 chmod 0664`

#### Compare folders
Finally, to be able to compare folders, use the command
`diff --brief -r folder1/ folder2/` to be able to find the differences.

#### Piping
The output of programs can either be shown to the screen or to a file (stdout). One method
to do both is to do `command | tee outputfile` to do both.

### Mouse not working
Sometimes when restarting a Thinkpad, the buttons on the trackpad do not work. The basic
method is to reconnect the device, along with reset some of the xinput settings as
necessary.

<details>
<summary>touchpad.sh</summary>
{% highlight shell %}
{% include touchpad.sh %}
{% endhighlight %}
</details>
<h6>&nbsp;</h6>

### systemd
It can be helpful to restart the networkmanager if it fails to work correctly. This can
alse be used on different services as necessary.
{% highlight shell %}
sudo systemctl restart networking
sudo systemctl restart network-manager
{% endhighlight %}

#### NetworkManager-wait-online.service Delay
Sometimes when turning off a computer, there is a delay from the
NetworkManager-wait-online.service. To change this setting, edit the file in
/lib/systemd/system/NetworkManager-wait-online.service and change the timeout to 10 from
90.

#### Boot Analysis
There are multiple methods to get the boot time of the system. `systemd-analyze blame`
shows how long each service took to startup. `systemd-analyze critical-chain` shows the
chain of calling services, along with which ones delayed the following service. Finally,
`systemd-analyze plot > plot.svg` plots all of the services onto a time graph.

### Grub
Grub is the default way Ubuntu and other Linux distributions use in order to start Linux,
Windows, or other OSes. Some of the configuration settings that can be used include
`GRUB_DEFAULT=saved` and `GRUB_SAVEDEFAULT=true` which saves the last entry (nice when
updating windows), `GRUB_TIMEOUT=1` for quick booting, and `GRUB_CMDLINE_LINUX_DEFAULT=""`
to view boot messages instead of the normal graphical view.

On Ubuntu 20.04 there is an issue when using Grub and Secure boot where sometimes the grub
menu can be hidden (for example only showing the vender logo like Lenovo). To fix this
issue [uncomment the graphical
terminal](https://medium.com/@leijerry888/get-grub-menu-back-after-installing-ubuntu-20-04-alongside-windows-dab5de5afc37)
`GRUB_TERMIANL=console`.

### Applications

#### Wireshark
In order to start wireshark [without using
sudo](https://askubuntu.com/questions/748941/im-not-able-to-use-wireshark-couldnt-run-usr-bin-dumpcap-in-child-process),
several things need to be changed.

First, use `sudo adduser $USER wireshark` to add the current user to the wireshark group.
Next, run the following two commands. The first should be set as yes to allow access.
{% highlight shell %}
sudo dpkg-reconfigure wireshark-common
sudo chmod +x /usr/bin/dumpcap
{% endhighlight %}

<details>
<summary>To turn off Wireshark access, do the opposite and select no</summary>
{% highlight shell %}
sudo dpkg-reconfigure wireshark-common
sudo chmod -x /usr/bin/dumpcap
{% endhighlight %}
</details>

#### a2ps
[a2ps](https://linux.die.net/man/1/a2ps) is a program to print files (like code) to
postscript or pdf along with having nice formatting. Some
[options](http://web.engr.oregonstate.edu/~traylor/ece473/beamer_lectures/a2ps.pdf) that
are nice to have include `-P pdf` for printing to pdf (or `--printer=`),
`--file-align=virtual` so there are no blank spots on pages, `--medium=Letter` to change
from the default page size, `--header=` or `--left-footer="text"` to change the headers
(with [meta sequences](http://theochem.ki.ku.dk/on_line_docs/a2ps/a2ps_3.html) like %E for
date in local format), and `-T 4` (or --tabsize) for 4 spaces per tab.

An overall command could then be `a2ps -P pdf <files> --file-align=virtual --medium=Letter
--header= --left-footer="Name - %E" -T 4`.
