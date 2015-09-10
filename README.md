# purescript-sammy

[Purescript](http://www.purescript.org/) bindings for [Sammy.js](http://sammyjs.org/), a Javascript, browser-based [Sinatra](http://www.sinatrarb.com/)-clone.

- [Module Documentation](docs/Sammy.md)
- [Example](test/Main.purs)

## Features

- HTTP verbs: `GET`, `PUT`, `POST`, `DELETE`
- Extraction of parameters with `params`, returns a list of parameters with a name, empty list if no parameter present, single element if only one parameter exists.
- Sammy.js events and event bindings (only by string-name for now)
- Redirect to a route

## Usage

To build the test project, clone this repo and then run:

    pulp dep update
    pulp build
    pulp test -r cat > examples/index.js

To use this library in your own project:

    pulp dep i purescript-sammy
