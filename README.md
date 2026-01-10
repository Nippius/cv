# About

This repo contains my Curriculum Vitae. You are free to modify it to create your own but please don't use my resume for anything else without my permission.

Do take a look to the [Awesome-CV](https://github.com/posquit0/Awesome-CV) template if you want to do more advanced stuff (like cover letters for example).

# How to build:

- Download [TeXLive](http://tug.org/texlive/acquire-netinstall.html) and extract it's contents to a folder.

- Create a environment variable called TEXDIR with the value <path_to_text_live_bin_folder>

- Update the path to Xelatex inside build.ps1 ($TEX_LOCATION variable) if needed.

- Run build.ps1 to build all the documents.

- Run clean.ps1 to clean the builds (this deletes the output) if needed.

The output files are stored in the /out folder