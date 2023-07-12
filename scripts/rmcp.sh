#!/usr/bin/env bash

# These scripts should not be executed.

rm -frv "$HOME"/.*
cp -frv ../.config ../.gf ../.bashrc ../.gitconfig "$HOME"
