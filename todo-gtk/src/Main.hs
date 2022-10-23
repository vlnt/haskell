{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedLabels  #-}
{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Monad                              (void)
import Data.Text                                  (Text)
import Data.Vector                                (Vector)
import qualified Data.Vector                   as Vector
import qualified Data.Vector.Mutable           as MVector
import qualified GI.Gtk                        as Gtk
import           GI.Gtk.Declarative
import           GI.Gtk.Declarative.App.Simple

data Todo = Todo
  { name :: Text
  , completed :: Bool
  }

toggleCompleted :: Todo -> Todo
toggleCompleted todo = todo { completed = not (completed todo) }

data State = State
  { todos :: Vector Todo
   ,currentText :: Text
  }

data Event 
  = TodoTextChanged Text
  | TodoSubmitted
  | TodoToggled Int
  | Closed

view' :: State -> AppView Gtk.Window Event
view' s = 
    bin Gtk.Window [#title := "todoGTK" , on #deleteEvent (const (True, Closed))]
         (container Gtk.Box
             [#orientation := Gtk.OrientationVertical]
             [todoList, newTodoForm]
             )
         where
            todoList = BoxChild defaultBoxChildProperties { expand = True, fill = True }
                    $ container Gtk.Box
                         [#orientation := Gtk.OrientationVertical]
                         (Vector.imap todoItem (todos s))

            todoItem i todo = bin Gtk.CheckButton [#active := completed todo, on #toggled (TodoToggled i)]
                                 $ widget Gtk.Label [#label := completedMarkup todo
                                                    , #useMarkup := True
                                                    , #halign := Gtk.AlignStart]
                              where
                                completedMarkup todo
                                   | completed todo = "<s>" <> name todo <> "</s>"
                                   | otherwise      = name todo

            newTodoForm = widget
                Gtk.Entry
                [ #text := currentText s
                 , #placeholderText := "What needs to be done?"
                 , onM #changed (fmap TodoTextChanged . Gtk.entryGetText)
                 , on #activate TodoSubmitted
                ]

update' :: State -> Event -> Transition State Event
update' s e = case e of
    TodoTextChanged t -> Transition s { currentText = t } (pure Nothing)
    TodoSubmitted ->
        let newTodo = Todo {name = currentText s, completed = False}
        in  Transition
          s { todos = todos s `Vector.snoc` newTodo, currentText = mempty }
          (pure Nothing)
    TodoToggled i -> Transition s { todos = mapAt i toggleCompleted (todos s) } (pure Nothing)
    Closed -> Exit

mapAt :: Int -> (a -> a) -> Vector a -> Vector a
mapAt i f = Vector.modify (\v -> MVector.write v i . f =<< MVector.read v i)

main :: IO ()
main = void $ run App {view = view', update = update', inputs = [], initialState = State {todos = mempty, currentText = mempty}}
