{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.GI.Base
import qualified GI.Gtk as Gtk

main :: IO ()
main = do
    Gtk.init Nothing

    win <- new Gtk.Window[#title := "Intro"]
    on win #destroy Gtk.mainQuit
    #showAll win

    Gtk.main
