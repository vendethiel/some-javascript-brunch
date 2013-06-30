module.exports = class SomeJavaScriptCompiler
  brunchPlugin: yes
  type: 'javascript'
  extension: 'js'

  (config) ->
    @files = config.plugins.javascripts

  isValid: ->
    it in @files or 0 is it.indexOf 'vendor/scripts/brunch'

  compile: !(data, path, callback) ->
    try
      path.=replace /\\/g '/' #'
      callback null, if @isValid path
        data
      else null
    catch
      callback e