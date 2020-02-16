#!/bin/bash

brew update && \
brew outdated && \
brew bundle --global --verbose && \
terminal-notifier -message 'Brew Update Completed'
