#
# grunt-phpdcd
#
#
'use strict'

module.exports = (grunt) ->
  grunt.initConfig
    phpdcd:
      test:
        dir: ['test']
      options:
        bin: 'vendor/bin/phpdcd'

  grunt.loadTasks 'tasks'

  grunt.registerTask 'default', ['phpdcd']

