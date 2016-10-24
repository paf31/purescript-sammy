-- | This module provides low-level PureScript bindings to the Sammy.js web framework.
module Sammy
  ( route
  , redirect
  , bindEvent
  , trigger
  , params
  , sammy
  , runApp
  , get
  , put
  , post
  , del
  , SammyCtx()
  , SammyApp()
  , SAMMY()
  , Route()
  ) where

import Prelude (Unit)
import Control.Monad.Eff (Eff)

-- | The Sammy context contains URL parameters, and provides the ability to redirect to other routes.
foreign import data SammyCtx :: *

-- | A Sammy application, which can be used to associate routes with behaviors.
foreign import data SammyApp :: *

-- | The effect associated with Sammy applications.
foreign import data SAMMY :: !

-- | A route is just a string
type Route = String

-- | Create a new Sammy application.
foreign import sammy :: forall eff. String -> Eff (sammy :: SAMMY | eff) SammyApp

-- | Run a Sammy application, providing a default route.
foreign import runApp :: forall eff. SammyApp -> Route -> Eff (sammy :: SAMMY | eff) Unit

-- | Associate a route and method with a handler function.
-- |
-- | The handler should return `false` to prevent the default behavior for a form submission.
foreign import route :: forall eff. SammyApp -> String -> Route -> (SammyCtx -> Eff (sammy :: SAMMY | eff) Boolean) -> Eff (sammy :: SAMMY | eff) Unit

-- | Read the parameters for a key from the URL.
foreign import params :: forall eff. SammyCtx -> String -> Eff (sammy :: SAMMY | eff) (Array String)

-- | Trigger an event.
foreign import trigger :: forall eff. SammyApp -> String -> Eff (sammy :: SAMMY | eff) Unit

-- | Bind an event to a handler function.
foreign import bindEvent :: forall eff. SammyApp -> String -> (SammyCtx -> (Eff (sammy :: SAMMY | eff) Unit)) ->  Eff (sammy :: SAMMY | eff) Unit

-- | Redirect to a Route
foreign import redirect :: forall eff. SammyCtx -> Route -> Eff (sammy :: SAMMY | eff) Unit

-- | Associate a route with a handler function for `GET` requests.
get :: forall eff. SammyApp -> Route -> (SammyCtx -> Eff (sammy :: SAMMY | eff) Boolean) -> Eff (sammy :: SAMMY | eff) Unit
get app path fn = route app "get" path fn

-- | Associate a route with a handler function for `POST` requests.
post :: forall eff. SammyApp -> Route -> (SammyCtx -> Eff (sammy :: SAMMY | eff) Boolean) -> Eff (sammy :: SAMMY | eff) Unit
post app path fn = route app "post" path fn

-- | Associate a route with a handler function for `PUT` requests.
put :: forall eff. SammyApp -> Route -> (SammyCtx -> Eff (sammy :: SAMMY | eff) Boolean) -> Eff (sammy :: SAMMY | eff) Unit
put app path fn = route app "put" path fn

-- | Associate a route with a handler function for `DELETE` requests.
del :: forall eff. SammyApp -> Route -> (SammyCtx -> Eff (sammy :: SAMMY | eff) Boolean) -> Eff (sammy :: SAMMY | eff) Unit
del app path fn = route app "del" path fn
