# README

## Basic Instructions
1. Make sure you have vagrant installed on your host machine.
2. Clone this repo `git clone https://github.com/emintham/vagrant`
3. `cd vagrant`
4. `vagrant init`
5. `vagrant add box "ubuntu/trusty64"`
6. `vagrant up <environment>`

## Caveats
- The default RAM is 4GB, set this to something smaller if this is too large for your use.
- You should probably change the bootstrap to pull your editor settings and shell settings unless you don't really care.

# Supported Development Environments
- basic
- node
- haskell
- purescript
- python (2.7)
- ruby
