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
    #resize win 640 480

    box <- new Gtk.Box [ #orientation := Gtk.OrientationVertical ]
    #add win box

    msg <- new Gtk.Label[#label := "Hello"]
    #packStart box msg True False 10

    btn <- new Gtk.Button [ #label := "Click me!" ]
    #packStart box btn False False 10
    on btn #clicked (set msg [ #label := "Clicked!"])

    #showAll win

    Gtk.main
