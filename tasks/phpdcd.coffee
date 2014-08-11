###
grunt-phpdcd

Copyright (c) 2013 Muhammad Adeel Nawaz
Licensed under the BSD license.
###

module.exports = (grunt) ->
  phpdcd = (require './lib/phpdcd').init grunt

  grunt.registerMultiTask 'phpdcd', 'Run phpdcd', ->
    phpdcd.setup @
    phpdcd.run()
