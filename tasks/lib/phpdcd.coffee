###
grunt-phpdcd

Copyright (c) 2013 Muhammad Adeel Nawaz
Licensed under the BSD license.
###

path = require 'path'
exec = (require 'child_process').exec

exports.init = (grunt) ->

  exports = config = {}
  cmd = done = null
  defaults =
    bin: 'phpdcd'
    #A comma-separated list of file names to check (default: ["*.php"])
    names: false
    #A comma-separated list of file names to exclude
    namesExclude: false
    #Exclude a directory from code analysis (multiple values allowed)
    exclude: false
    #Report code as dead if it is only called by dead code
    recursive: false
    #Do not output any message
    quiet: false
    #Increase the verbosity of messages
    ##1 for normal output
    ##2 for more verbose output
    ##3 for debug
    verbose: false
    noInteraction: true
    maxBuffer: 200*1024

  buildCommand = (dirs) ->
    cmd = "#{path.normalize config.bin}"
    cmd += " #{dirs}" if dirs
    cmd += " --names #{config.names}" if config.names
    cmd += " --names-exclude #{config.namesExclude}" if config.namesExclude
    cmd += (config.exclude.map (exclude) -> " --exclude #{exclude}").join ' ' if config.exclude
    cmd += " --recursive" if config.recursive
    cmd += " --quiet" if config.quiet
    cmd += " -" + Array(config.verbose + 1).join "v" if config.verbose
    cmd += " --no-interaction" if config.noInteraction
    cmd

  exports.setup = (runner) ->
    dirs = if runner.data.dir.length
    then (runner.data.dir.map (dir) -> path.normalize dir).join ' '
    else false
    config = runner.options defaults
    cmd = buildCommand dirs
    grunt.log.writeln "Starting phpdcd (target: #{runner.target.cyan}) in #{dirs.cyan}"
    grunt.verbose.writeln "Execute: #{cmd}"
    done = runner.async()

  exports.run = ->
    cmdOptions = maxBuffer: config.maxBuffer
    exec cmd, cmdOptions, (err, stdout, stderr) ->
      grunt.log.write stdout if stdout

      # As documented on # http://phpmd.org/documentation/index.html#exit-codes
      grunt.fatal stdout if err and err.code isnt 2

      done()

  exports
