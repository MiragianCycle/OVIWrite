   _____     _______        __    _ _       
  / _ \ \   / /_ _\ \      / / __(_) |_ ___ 
 | | | \ \ / / | | \ \ /\ / / '__| | __/ _ \
 | |_| |\ V /  | |  \ V  V /| |  | | ||  __/
  \___/  \_/  |___|  \_/\_/ |_|  |_|\__\___|
                                            
**A Vim/NeoVim Configuration for Writing and Writers**

## FAQ

#### WHAT THE HECK IS 'OVIWrite'?

OVIWrite (as in *Oh-Vi-Write*) is an attempt to make (Neo)Vim writer friendly out of the box?


#### WHY?

I am a writer, not a tech person. Coming across Vim for the first time last year was revelatory, but I'd be lying if I said the adoption process was easy. Indeed, it took me over two months to get Vim ready for my writing workflow. The result is that most writers would abandon Vim as too complex a beast. This repo is an attempt to address that potential loss of a user-group who stand to gain much from Vim.


#### APPROACH

The assumption here is that you, a writer, have already downloaded and installed Vim/GVim/NeoVim on your system. I have also assumed that you are on the verge of configuring your .vimrc file to be writer friendly. 

If both of the above cases are true, then all you need to do is to download the vimrc in this repo and paste it into the appropriate file in the appropriate location based on your system. Default destinations for .vimrcs:

**MacOS and Unix**:        $HOME/.vimrc or $HOME/.vim/vimrc
**MS-Windows**  $HOME/_vimrc, $HOME/vimfiles/vimrc or $VIM/_vimrc


#### A NOTE ON PACKAGE MANAGERS

I primarily use Vim-Plug to manage Plugins within Vim. Mostly because I've found it to be the easiest. The conventions used here will be for Vim-Plug. I will probably adapt this to Packer at some point as I move to NeoVim, and a Lua-based config file, instead of the standard .vimrc. 


#### PLUGINS FOR WRITING AND WRITERS 

As this .vimrc aims to be plug and play for writers interested in using Vim for their writing, I have chosen a fairly opinionated approach to what plugins (see section on Plugins for more details), what defaults (line-wrapping, relative numbers, etc.,), are necessary to begin writing on Vim immediately. This doesn't mean that this .vimrc can't be changed based on user preference; indeed Vim truly shines when you take the time to mould it for your **exact** specifications.  The .vimrc has extensive comments to enable the final user to add, remove, and modify to their heart's content. 


#### KEY-BINDINGS

The key-bindings I've used here are built around my (admittedly) wonky typing and keyboard recall. The SPACEBAR is the Leaderkey because it is the most ergonomically sound for me. If you feel otherwise, you are free to change. 

## Demo

Insert gif or link to demo


## Authors

- [@katherinepeterson](https://www.github.com/octokatherine)


## License

[MIT](https://choosealicense.com/licenses/mit/)


