module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    browserify:
      dist:
        files:
          'dest/clk-hide.js': ['src/**/*.coffee']
        options:
          transform: [
            ['coffeeify', {

            }]
          ]
          plugin: [
          ]

    uglify:
      app:
        options:
          report: 'min'
          preserveComments: 'some'
        src: 'dest/clk-hide.js'
        dest: 'dest/clk-hide.min.js'

  # Load installed tasks
  grunt.file.glob
  .sync('./node_modules/grunt-*/tasks')
  .forEach(grunt.loadTasks)

  grunt.registerTask 'default', [
    'browserify', 'uglify'
  ]
