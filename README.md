# wiki-md

[![This project is considered experimental](https://img.shields.io/badge/status-experimental-critical.svg)](https://benknoble.github.io/status/experimental/)

A file- and syntax-agnostic wiki built on vanilla vim. Pairs best with markdown
and universal ctags.

## Goals

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

## What does it do?

wiki-md adds a new filetype (`wiki`) to vim's repertoire, and uses it to adjust
`'path'` according to the location of the wiki tree. It provides a handful of
autoloaded library functions that may prove useful in crafting management or
navigation systems.

Yes, that's really it.

It doesn't seem like a lot, but the first two points alone (the filetype and
`'path'` adjustment) are worth spelling out:

- because the new filetype is *added* to existing filetypes, any kind of file
  (text, source code, documentation, markup, or otherwise) can be a wiki entry
- because a filetype exists for that targets all wiki entries, you can customize
  your experience in those files by adding to an `ftplugin`, the standard vim
  customization tool
- because wiki-md sets `'path'` to include the entire wiki tree, `gf`, `:find`,
  and all the variants thereof create hyperlinks between a word in *any* entry
  (code or otherwise) to other entries; that is, a javascript file containing
  the text `// see functional.md` automatically contains a link to the wiki
  entry `functional.md`, wherever it is in the directory tree. Better, it's only
  two keystrokes away.

## How do I get started?

Install with your favorite plugin manager, and `let g:wiki_root =` your wiki
path in your vimrc. (The default is `~/.wiki`.)

Editing files that live under the directory named by `g:wiki_root` will
automatically pick-up the `wiki` filetype in addition to their regular
filetypes, as described above. The wiki tree will also be added to `'path'`.

At this point, it's up to you! Design a wiki system that makes sense to you. You
may like to use some of the functions documented in `:help wiki-md-functions`
when designing a system of commands or mappings.

The author enjoys using markdown files for structured notes and design, but
liberally includes raw code files to demonstrate ideas or track
programs/functions of interest. The author also attempts to maintain a directory
layout as a substitute for tags; everything in `~/.wiki/zsh`, for example, is
related to the Z-shell. The author liberally sprinkles cross-references in
comments and in notes, knowing that `'path'` will help him navigate his wiki. He
also keeps it under version control and generates tags to take advantage of
vim's `:tag` related commands and mappings.

## Where can I share my ideas about configuration or read about others?

I'm so glad you asked: I greatly appreciate and encourage the sharing of
systems, usage patterns, mappings, commands, and customization that create each
person's unique wiki experience. I think we all have something to learn from
each other's perspective on information management.

To that end, I encourage you to share and discuss your ideas right here on the
repository via GitHub's discussions feature.

I do not use social media and am rarely on Reddit, and I find those and most
other methods both disorganized and not discoverable. Of course, you should feel
free to share in whatever way you wish, but others may benefit if you share here
:)

## Addendum

It is remarkably difficult to describe something which is simultaneously the
absence of so much and the power to do anything. While I expect the codebase to
remain relatively stable (excepting finding and fixing bugs), I will greatly
appreciate the time and feedback of anyone who finds the documentation
confusing, unclear, or boring. (This includes both this README and the online
help.) It is my aim to make this power exciting and put it in the hands of those
who want it; I fear that a poor attempt to describe what is contained here will
turn away so many who might otherwise enjoy this plugin.
