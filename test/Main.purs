module Test.Main (main) where

import Prelude (bind, return, show, (<>), Unit)

import Sammy (runApp, bindEvent, post, get, sammy, params, trigger, SAMMY)

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Control.Monad.Eff.JQuery as J
import DOM (DOM)

main :: forall t.
        Eff
          ( sammy :: SAMMY
          , dom :: DOM
          , console :: CONSOLE
          | t
          )
          Unit
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
