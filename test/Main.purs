module Test.Main (main) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Sammy (runApp, bindEvent, post, get, sammy, params, trigger, SAMMY)

main :: forall eff. Eff (sammy :: SAMMY, console :: CONSOLE | eff) Unit
main = do
  app <- sammy "#main"
  get app "#/" (getHome app)
  post app "#/foo" postFoo
  bindEvent app "loaded" eventHandler
  runApp app "#/"

  where
    getHome app _ = do
      trigger app "loaded"
      pure false

    postFoo ctx = do
      foo <- params ctx "foo"
      log ("POST " <> show foo)
      pure false

    eventHandler _ = log "Page loaded"
