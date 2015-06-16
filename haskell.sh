#! /usr/bin/env bash

HOME=/home/vagrant
if [ -f ${HOME}/.zshrc ]; then
    SHELLRC=${HOME}/.zshrc
else
    SHELLRC=${HOME}/.bashrc
fi


# -- Haskell --
CABAL_DIR=/opt/cabal/head/bin/
GHC_DIR=/opt/ghc/head/bin/

sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y zlib1g-dev pkg-config build-essential autoconf \
    automake ghc-head cabal-install-head

PATH=${CABAL_DIR}:${GHC_DIR}:$PATH
echo >> ${SHELLRC}
echo '# -- Haskell Paths --' >> ${SHELLRC}
echo 'export PATH=/opt/ghc/head/bin/:$PATH' >> ${SHELLRC}
echo 'export PATH=/opt/cabal/head/bin/:$PATH' >> ${SHELLRC}
echo 'export PATH=/home/vagrant/.cabal/bin/:$PATH' >> ${SHELLRC}
echo >> ${SHELLRC}

cabal update && \
    cabal install happy hlint hspec quickcheck hoogle
echo ':set prompt "ghci> "' >> ${HOME}/.ghci
chown vagrant ${HOME}/.ghci
chmod 644 ${HOME}/.ghci
