module.exports =
  configureWebpack: (config) ->
    if process.env.NODE_ENV = 'production'
      config.output.publicPath = ''
    config.module.rules
      .push
        test: /\.coffee$/
        use: [ 'babel-loader', 'coffee-loader' ]
    return
