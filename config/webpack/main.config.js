var path = require('path');
var webpack = require('webpack');

var config = module.exports = {
  //the base path used to resolve entry points
  context: path.join(__dirname, '..', '..'),
  entry: path.join(__dirname, '..', '..', 'client', 'js', 'entry.js')
};

config.output = {
  path: path.join(__dirname,'..', '..', 'app', 'assets', 'javascripts', 'bundle'),
  filename: 'main-bundle.js',
  publicPath: '/assets',
};

config.resolve = {
  extensions: ['', '.js', '.jsx', '.js.jsx'],
  modulesDirectories: ['node_modules'],
};

config.module = {
  loaders: [
    {
      test: /\.jsx?$/,
      loader: 'babel',
      exclude: /node_modules/ ,
      query: {
        presets: ['react']
      }
    },
    {
      test: /\.css$/,
      loader: "style-loader!css-loader" 
    }
  ]
}

config.plugins = [
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
];

