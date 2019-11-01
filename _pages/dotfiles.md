---
layout: post
title: "Dotfiles - bash/vim"
date: 2019-01-01
---
Some dotfiles can be found [here](https://github.com/mwyoung/Dotfiles).

There are many ways to configure bash/vim setups, but it should not be done not knowing
what commands are being set (so don't do it blindly, consult a [man
page](https://linux.die.net/man/)).

### Bash
One easy way to have a custom [bash
aliases](https://github.com/mwyoung/Dotfiles/blob/master/.bash_aliases) is to use a
`~/.bash_aliases` file, as the main .bashrc should call it once done setting up the bash
prompt. One great alias is `"cd $(ls -td path/to/folder/*/ | head -1)"`, which goes to the
last modified folder.

<details>
<summary>.bash_aliases</summary>
{% highlight shell%}
{% include .bash_aliases %}
{% endhighlight %}
</details>
<h6>&nbsp;</h6>

### Vim
Basic vim can be hard to use at times, but adding certain options can make it easier to
use. The [.vimrc file](https://github.com/mwyoung/Dotfiles/blob/master/.vimrc) below
contains the current options that can be used, along with comments about what each line
does.

One way to extend vim is with [plugins](https://github.com/junegunn/vim-plug), along with
using [vim fugitive](https://github.com/tpope/vim-fugitive) for git and [vim
airline](https://github.com/vim-airline/vim-airline) for making vim look better.

Vim can redo a previous command with `q:`, and then in insert mode (`i`) can edit and then
with `enter` run the command.

One easy way to reformat markdown files is to `set textwidth=80`, highlight lines
(`Shift+V`), and then use `gq` to format to that textwidth.

Also helpful is spellcheck that can be toggled with `,s` and then use `\s` to show
suggestions.

<details>
<summary>.vimrc</summary>
{% highlight shell%}
{% include .vimrc %}
{% endhighlight %}
</details>
<h6>&nbsp;</h6>

### Miscellaneous
#### Rsync
When syncing between two machines, rsync can be nice as it can include/exclude files from
a file, and only copy changed files.
<details>
<summary><a href="https://github.com/mwyoung/Dotfiles/blob/master/copy.sh">copy.sh</a>
</summary>
{% highlight shell%}
{% include copy.sh %}
{% endhighlight %}
</details>
<details>
<summary>include/exclude</summary>
<h4><b>copy_include</b></h4>
{% highlight shell%}
{% include copy_include %}
{% endhighlight %}
<h4><b>copy_exclude</b></h4>
{% highlight shell%}
{% include copy_exclude %}
{% endhighlight %}
</details>
<h6>&nbsp;</h6>

#### Git
Git is a pretty good source control manager, and can be used locally (without GitHub) if
necessary.
