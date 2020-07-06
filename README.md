# wiki-md

[![This project is considered stable](https://img.shields.io/badge/status-stable-success.svg)](https://benknoble.github.io/status/stable/)

A file- and syntax-agnostic wiki platform built on vanilla vim. Pairs well with
markdown and universal ctags.

Ultimately, the goal is to provide a platform or scaffold on which to build your
unique wiki- and information-management system.

## What does it do?

wiki-md targets a given directory tree (`g:wiki_root`, defaults to `~/.wiki`)
for use with vim's `'path'` option and provides a handful of autoloaded library
functions that may prove useful in crafting management or navigation systems.

Yes, that's really it.

It doesn't seem like a lot, but here are a few abilities provided by those
two features:

- press `gf` on any word in a wiki document to treat it like a wiki-link, so
  comments in your code and notes in your markdown instantly become potential
  wiki documents (learn more about the power of `'path'`
  [here](https://github.com/tpope/vim-apathy))
- use `:find` and related commands in your wiki to instantly locate a wiki
  document you're looking for, or build your own custom commands/maps using
  `wiki#goto` and `wiki#complete_wikis`
- jump to the root of the wiki, search the entire wiki, or build indexes with
  the autoloaded functions `wiki#edit_root`, `wiki#search`, and
  `wiki#tree_index`/`wiki#flat_index`

## How do I get started?

Install with your favorite plugin manager, and `let g:wiki_root =` your wiki
path in your vimrc. (The default is `~/.wiki`.)

Editing files that live under the directory named by `g:wiki_root` will
automatically have the `wiki` filetype *in addition to their regular filetypes*.
Javascript will still be javascript, and markdown will still be markdown. But
they will *also* be wikis!

Ay file with the `wiki` filetype will have the wiki tree added to `'path'`.
This enables `gf` anywhere, as well as other features.

### Advanced

At this point, it's up to you! Design a wiki system that works for you. You may
like to use some of the functions documented in `:help wiki-md-functions` when
designing a system of commands or mappings.

You will probably also want to take advantage of the `wiki` filetype, which
you'll remember is added to the filetypes of all your wiki documents. That means
you can use `~/.vim/after/ftplugin/wiki.vim` to add custom mappings, commands,
or options to all your wiki documents!

For example, I enjoy using markdown files for structured notes and design but
liberally include raw code files to demonstrate ideas or track
programs/functions of interest. I also *attempt* to maintain a directory layout
as a substitute for tags; everything in `~/.wiki/zsh`, for example, is related
to the Z-shell. I liberally sprinkle cross-references in comments and in notes,
knowing that `'path'` will help me navigate. I also keep it under version
control and automatically generate tags to take advantage of vim's `:tag`
related commands and mappings.

## Where can I share my ideas about configuration or read about others?

I'm so glad you asked: I greatly appreciate and encourage the sharing of
systems, usage patterns, mappings, commands, and customization that create each
person's unique wiki experience. I think we all have something to learn from
each other's perspective on information management.

To that end, I encourage you to share and discuss your ideas right here on the
repository by [creating an issue to share your
setup](https://github.com/benknoble/wiki-md/issues/new?template=custom-setup.md).
Make sure to use the tag
[custom-setup](https://github.com/benknoble/wiki-md/labels/custom-setup), and
include your name in the title (see [my
example](https://github.com/benknoble/wiki-md/issues/5)).  Unfortunately, when I
released this plugin, GitHub Discussions was not out of Beta, so that was not an
option then.

I do not use social media and am rarely on Reddit, and I find those and most
other methods both disorganized and not discoverable. Of course, you should feel
free to share in whatever way you wish, but others may benefit if you share here
:)

## Principles

wiki-md aims to be a small wiki plugin for vim.

It prefers to be filetype- and syntax-agnostic, to build on core vim
capabilities, to avoid bloat, and to be versatile.

It is not a wiki *manager*, nor is it a wiki *editor*. It does not include
calendars, alarms, checklists, tags, or hierarchical outlines.

It prefers customization over sane defaults; it acknowledges that everyone
has their own exobrain system, and attempts to enhance the experience of
navigating it by staying out of the way.

It prefers library-style functions and a do-it-yourself attitude, so *you* are
in control of your wiki. Create commands, mappings, flashy popups, and more to
make the experience what *you* want it to be.

## Addendum

It is remarkably difficult to describe something which is simultaneously the
absence of so much and the power to do anything. While I expect the codebase to
remain relatively stable (excepting finding and fixing bugs), I will greatly
appreciate the time and feedback of anyone who finds the documentation
confusing, unclear, or boring. (This includes both this README and the online
help.) It is my aim to make this power exciting and put it in the hands of those
who want it; I fear that a poor attempt to describe what is contained here will
turn away so many who might otherwise enjoy this plugin.
