## Module Sammy

This module provides low-level PureScript bindings to the Sammy.js web framework.

#### `SammyCtx`

``` purescript
data SammyCtx :: Type
```

The Sammy context contains URL parameters, and provides the ability to redirect to other routes.

#### `SammyApp`

``` purescript
data SammyApp :: Type
```

A Sammy application, which can be used to associate routes with behaviors.

#### `SAMMY`

``` purescript
data SAMMY :: Effect
```

The effect associated with Sammy applications.

#### `Route`

``` purescript
type Route = String
```

A route is just a string

#### `sammy`

``` purescript
sammy :: forall eff. String -> Eff (sammy :: SAMMY | eff) SammyApp
```

Create a new Sammy application.

#### `runApp`

``` purescript
runApp :: forall eff. SammyApp -> Route -> Eff (sammy :: SAMMY | eff) Unit
```

Run a Sammy application, providing a default route.

#### `route`

``` purescript
route :: forall eff. SammyApp -> String -> Route -> (SammyCtx -> Eff (sammy :: SAMMY | eff) Boolean) -> Eff (sammy :: SAMMY | eff) Unit
```

Associate a route and method with a handler function.

The handler should return `false` to prevent the default behavior for a form submission.

#### `params`

``` purescript
params :: forall eff. SammyCtx -> String -> Eff (sammy :: SAMMY | eff) (Array String)
```

Read the parameters for a key from the URL.

#### `trigger`

``` purescript
trigger :: forall eff. SammyApp -> String -> Eff (sammy :: SAMMY | eff) Unit
```

Trigger an event.

#### `bindEvent`

``` purescript
bindEvent :: forall eff. SammyApp -> String -> (SammyCtx -> (Eff (sammy :: SAMMY | eff) Unit)) -> Eff (sammy :: SAMMY | eff) Unit
```

Bind an event to a handler function.

#### `redirect`

``` purescript
redirect :: forall eff. SammyCtx -> Route -> Eff (sammy :: SAMMY | eff) Unit
```

Redirect to a Route

#### `get`

``` purescript
get :: forall eff. SammyApp -> Route -> (SammyCtx -> Eff (sammy :: SAMMY | eff) Boolean) -> Eff (sammy :: SAMMY | eff) Unit
```

Associate a route with a handler function for `GET` requests.

#### `post`

``` purescript
post :: forall eff. SammyApp -> Route -> (SammyCtx -> Eff (sammy :: SAMMY | eff) Boolean) -> Eff (sammy :: SAMMY | eff) Unit
```

Associate a route with a handler function for `POST` requests.

#### `put`

``` purescript
put :: forall eff. SammyApp -> Route -> (SammyCtx -> Eff (sammy :: SAMMY | eff) Boolean) -> Eff (sammy :: SAMMY | eff) Unit
```

Associate a route with a handler function for `PUT` requests.

#### `del`

``` purescript
del :: forall eff. SammyApp -> Route -> (SammyCtx -> Eff (sammy :: SAMMY | eff) Boolean) -> Eff (sammy :: SAMMY | eff) Unit
```

Associate a route with a handler function for `DELETE` requests.


