"use strict";

exports.sammy = function(selector) {
    return function() {
        return Sammy(selector, function(app) {
            return app;
        });
    };
};

exports.runApp = function(app) {
    return function(route) {
        return function() {
            app.run(route);
        };
    };
};

exports.route = function(smy) {
    return function(verb) {
        return function(path) {
            return function(fn) {
                return function() {
                    smy.route(verb, path, function(s) {
                        return fn(s)();
                    });
                };
            };
        };
    };
};

exports.params = function(smy) {
    return function(paramName) {
        return function() {
            var p = smy.params[paramName];
            if (typeof p === 'string') {
                return [p];
            } else if (typeof p === 'undefined') {
                return [];
            } else {
                return p;
            }
        };
    };
};

exports.trigger = function(smy) {
    return function(evt) {
        return function() {
            smy.trigger(evt);
        };
    };
};

exports.bindEvent = function(smy) {
    return function(evt) {
        return function(fn) {
            return function() {
                smy.bind(evt, function(s) {
                    fn(s)()
                });
            };
        };
    };
};

exports.redirect = function(smy) {
    return function(route) {
        return function() {
            smy.redirect(route);
        };
    };
};
