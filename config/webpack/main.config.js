var path = require('path');
var webpack = require('webpack');

var config = module.exports = {
  //the base path used to resolve entry points
  context: __dirname,
  entry: '../../client/js/entry.js'
};

config.output = {
  path: path.join(__dirname,'..', '..', 'app', 'assets', 'javascripts', 'bundles'),
  filename: 'bundle.js',
  publicPath: '/assets',
};

config.resolve = {
  extensions: ['', '.js', '.jsx', '.js.jsx'],
  modulesDirectories: ['node_modules'],
};

config.plugins = [

];
