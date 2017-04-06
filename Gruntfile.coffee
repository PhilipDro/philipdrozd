module.exports = (grunt) ->
  require('load-grunt-tasks') grunt

  grunt.initConfig
    clean:
      website: ['<%= dirs.target.base %>']
    coffee:
      website:
        files:
          '<%= dirs.target.js %>/main.js': '<%= dirs.src.coffee %>/main.coffee'
          '<%= dirs.target.js %>/motivation-list.js': '<%= dirs.src.coffee %>/motivation-list.coffee'
    concat:
      options:
        separator: ';\n'
      website:
        files:
          '<%= dirs.target.js %>/scripts.js': [
            '<%= dirs.target.js %>/main.js'
            '<%= dirs.target.js %>/motivation-list.js'
            '/var/www/html/philipdrozd/plugins/lazyload/jquery.lazyload.js'
          ]
    copy:
      deploy:
        files: [
          cwd: '<%= dirs.target.base %>/'
          dest: '<%= dirs.deploy %>/'
          expand: true
          src: ['**/*']
        ]
      website:
        files: [
            cwd: '<%= dirs.src.base %>/'
            dest: '<%= dirs.target.base %>/'
            expand: true
            src: ['**/*.html', 'php/*.php']
        ]
    dirs:
      plugins:
        base: 'plugins'
        lazyload: '<%= dirs.plugins.base %>/lazyload'
      src:
        base: 'src'
        coffee: '<%= dirs.src.base %>/coffee'
        images: '<%= dirs.src.base %>/images'
        sass: '<%= dirs.src.base %>/sass'
      target:
        base: 'target'
        css: '<%= dirs.target.base %>/css'
        images: '<%= dirs.target.base %>/images'
        js: '<%= dirs.target.base %>/js'
    htmlmin:
      website:
        options:
          collapseWhitespace: true
          removeComments: true
          removeEmptyAttributes: true
          removeRedundantAttributes: true
        files: [
          cwd: '<%= dirs.target.temp.base %>'
          dest: '<%= dirs.target.website.base %>'
          expand: true
          src: ['**/*.html']
        ]
    imagemin:
      options:
        cache: false
      website:
        files: [
          cwd: '<%= dirs.src.images %>/'
          dest: '<%= dirs.target.images %>/'
          expand: true
          src: ['**/*.{png,jpg,gif,svg}']
        ]
    sass:
      website:
        files:
          '<%= dirs.target.css %>/styles.css': '<%= dirs.src.sass %>/main.sass'
#        options:
#          cleancss: true
#          optimization: 2
#          report: 'min'
    pkg: grunt.file.readJSON 'package.json'
    uglify:
      website:
        files:
          '<%= dirs.target.js %>/scripts.min.js':
            '<%= dirs.target.js %>/scripts.js'
        options:
          sourceMap: true
    watch:
      coffee:
        files: '<%= dirs.src.coffee %>/*.coffee'
        tasks: [
          'coffee'
          'concat'
          #'uglify'
        ]
      php:
        files: '<%= dirs.src.base %>/**/*.php'
        tasks: ['copy:website']
      html:
        files: '<%= dirs.src.base %>/**/*.html'
        tasks: ['copy:website']
      images:
        files: '<%= dirs.src.images %>/**/*.{png,jpg,gif,svg}'
        tasks: ['imagemin:website']
      sass:
        files: '<%= dirs.src.sass %>/*.sass'
        tasks: ['sass:website']

  grunt.registerTask 'default', ['website']
  grunt.registerTask 'website', [
    'clean:website', 'coffee:website', 'concat:website', #'uglify:website',
    'imagemin:website', 'copy:website', 'sass:website'
  ]
  grunt.registerTask 'deploy', ['website', 'copy:deploy']

# vim:set ts=2 sw=2 sts=2:
