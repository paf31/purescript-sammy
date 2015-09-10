module Test.Main (main) where

import Prelude

import Sammy

import Control.Monad.Eff
import Control.Monad.Eff.Console

import qualified Control.Monad.Eff.JQuery as J

main = do
  app <- sammy "#main"
  get app "#/" (getHome app)
  post app "#/foo" postFoo
  bindEvent app "loaded" eventHandler
  runApp app "#/"
  
  where
  getHome app _ = do
    trigger app "loaded"
    return false
  
  postFoo ctx = do
    foo <- params ctx "foo"
    mainDiv <- J.select "#main"
    div <- J.create "<div>"
    J.appendText ("POST " <> show foo) div
    J.append div mainDiv
    return false
  
  eventHandler _ = log "Page loaded"