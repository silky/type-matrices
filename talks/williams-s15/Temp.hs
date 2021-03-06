-- -*- compile-command: "cabal --sandbox-config-file=$HOME/src/diagrams/cabal.sandbox.config exec -- ghc --make Temp && ./Temp -o Temp.pdf -w 400 -h 400" -*-
{-# LANGUAGE ExplicitForAll            #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE TypeFamilies              #-}

import           Diagrams.Backend.Cairo.CmdLine
import           Diagrams.Prelude

import           Data.List.Split
import           Diagrams

elts = map node "abcd"
eltSet = atop (roundedRect 6 6 0.5) . centerXY . vsep 1 . map (hsep 1) . chunksOf 2 $ elts

ls = ["aa", "abd", "badcab"]
lsD = vsep 1 (map drawList ls ++ [ellipsis # rotateBy (1/4)])

dia = [eltSet, arrowV (5 ^& 0), lsD] # map centerY # hsep 2
main = defaultMain $ dia
