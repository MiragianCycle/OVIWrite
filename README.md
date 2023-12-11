**An Integrated Writing Environment Based on NeoVim**

OVIWrite is a [NeoVim](https://neovim.io/) Integrated Writing Environment (IWE) powered by [LazyVim](https://lazyvim.github.io/) and [💤 lazy.nvim](https://github.com/folke/lazy.nvim)
to make it easy for writers to start using NeoVim out of the box. 

This begs the question: what *kind* of writer would gravitate towards OVIWrite? It is a fair question and it is covered in detail below.

Vim, at first, and now NeoVim have formed the basis of my dream writing environment. Who even dreams of their writing tools? Good question, I have no answers except I do venture outside regularly to touch grass - don't worry.

I wanted a writing tool that ticked these boxes:

 - Fast AF
 - Adaptable to any platform, desktop or mobile, Android or IOS
 - Had the features of traditional word processors (Spell and Grammar checking for instance)
 - Had quality of life improvements such as Version Control through Git
 - Supported a wide range of plain text standards such as Markdown and LaTeX
 - Switched seamlessly between three specific kinds of writing
   - Long form prose (i.e. novels)
   - Research and note-taking
   - Screenwriting

This is a tall order for any word processor. 

It is why conventional word processing software such as MS Word fails, at least for me. Granted I wrote my first novel on MS Word, I found that it was neither extensible enough to scale with my needs, nor was it nimble and fast. 

An ideal writing tool for me should adapt to my needs at a moment's notice:

Focus on the novel? Sure, here's a beautiful LaTeX template for me to work on my novel.

Write a screenplay? Why not?

Build an inter-connected network of notes like Obsidian or Notion? Done. 

Here are two demos I presented at the [NeoVimConf](https://neovimconf.live/) where I presented two early versions of OVIWrite.

- [Writing, Editing and World-Building at the Speed of Thought](https://www.youtube.com/watch?app=desktop&v=2ORWaIqyj7k) (ver 0.1)
- [Vimkipedia: Or How I Built my Second Brain Using Vim](https://www.youtube.com/watch?v=q80hXvorl0o) (version 0.2)

Essentially, these two talks served as early demos of OVIWrite, versions 0.1 and 0.2. I used a combination of Vim and NeoVim during these talks. This was primarily because I couldn't get the vimwiki plugin to work with NeoVim, a problem that I have since solved. 

The config is now entirely built with Lua, following the modular structure of LazyVim.

I consider this version 0.4 (Dec 11th 2023)

# Integrated Writing Environment 

The solution to my problem with my writing tools was simple: I needed an Integrated Writing Environment, a toolkit that was nimble and fast, yet extensible to meet all my *text* needs. I spent time writing on diverse IDEs;
in fact, my inspirations for OVIWrite were [VSCode](https://code.visualstudio.com/), [PyCharm](https://www.jetbrains.com/pycharm-edu/) and indeed the many Vim/NeoVim inspired *distros* like [NVChad](https://nvchad.com/), [LunarVim](https://www.lunarvim.org/), and [Doom Emacs](https://github.com/doomemacs/doomemacs). 


## Features

OVIWrite allows users to write in Markdown, LaTeX, Fountain (For Screenwriting) while, at the same time, having allowing the user to build a Personal Knowledge Base system (such as a Zettlekasten). See screenshots below. 

This setup is built to be as frictionless as possible for a reasonably experienced Vim/NeoVim user to install and get to writing. I myself use this setup for the following use-cases:

- LaTex documents for my novels
- Fountain files for writing scripts and screenplays
- Markdown and Org Mode files for writing essays
- Vim-wiki for my personal Zettlekasten 

I have tested this config on Linux, MacOS and Android (through Termux available on the F-Droid store [not Google Play Store]) environments.

Windows users: I would love feedback on your experiences as well as contributions.

The documentation here, much like the source code, is a fork of Lazy Vim. Thanks to the good folk there who have done an incredible job making this NeoVim distribution frictionless for us non-tech folk. 

![Screenshot](1.png)


![Screenshot](2.png)

![Screenshot](3.png)

[![Watch the video](https://img.youtube.com/vi/dEpuMM0zPeg/hqdefault.jpg)](https://youtu.be/dEpunM0zPeg)


- 🔥 Transform your Neovim into a full-fledged IDE
- 💤 Easily customize and extend your config with [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🚀 Blazingly fast
- 🧹 Sane default settings for options, autocmds, and keymaps
- 📦 Comes with a wealth of plugins pre-configured and ready to use

## ⚡️ Requirements

- Neovim >= **0.8.0** and its associated dependencies (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional but highly recommended)_**
- LaTeX compiler


## ROADMAP

This is mostly for myself, so that I stick with this and see this to its







## CAN I CONTRIBUTE?

Please, and thank you. 

Contributions are encouraged. Feel free to make a pull request with modifications. If you want to contribute at a deeper level - maybe even forking NeoVim for writing outright - do reach out to me. I will be happy to collaborate and learn from the community. 

### TODO: 

- Demo [  ]
- Windows Testing [  ]
- Tutorials [  ]
- Detailed documentation [  ]
- Screenshots [  ]

## Authors

- [@MiragianCycle](https://www.github.com/MiragianCycle), Theena Kumaragurunathan
- [@mhegreberg](https://github.com/mhegreberg), Mark Hegreberg

## License

[GNU GPLv3](https://choosealicense.com/licenses/gpl-3.0/)



