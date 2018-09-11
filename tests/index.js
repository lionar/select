'use strict';

require('./index.html');
require('./demo.styl');

const {Elm} = require('./src/Main.elm');

Elm.Main.init({node: document.getElementById('main')});
