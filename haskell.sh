#! /usr/bin/env bash

HOME=/home/vagrant


# -- Haskell --
CABAL_DIR=/opt/cabal/head/bin/
GHC_DIR=/opt/ghc/head/bin/

sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y zlib1g-dev pkg-config build-essential autoconf \
    automake ghc-head cabal-install-head

PATH=${CABAL_DIR}:${GHC_DIR}:$PATH
echo '# -- Haskell Paths --' >> ${HOME}/.bashrc
echo 'export PATH=/opt/ghc/head/bin/:$PATH' >> ${HOME}/.bashrc
echo 'export PATH=/opt/cabal/head/bin/:$PATH' >> ${HOME}/.bashrc
echo 'export PATH=/home/vagrant/.cabal/bin/:$PATH' >> ${HOME}/.bashrc
cabal update && \
    cabal install happy hlint hspec quickcheck hoogle
echo ':set prompt "ghci> "' >> ${HOME}/.ghci
chown vagrant ${HOME}/.ghci
chmod 644 ${HOME}/.ghci
