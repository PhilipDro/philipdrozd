module.exports = (grunt) ->
  require('load-grunt-tasks') grunt

  grunt.initConfig
    clean:
      website: ['<%= dirs.target.base %>']
    coffee:
      website:
        files:
          '<%= dirs.target.js %>/main.js': '<%= dirs.src.coffee %>/main.coffee'
    concat:
      options:
        separator: ';\n'
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
            src: ['**/*.html', '**/*.php']
          ,
            cwd: '<%= dirs.bower.fontAwesome %>/'
            dest: '<%= dirs.target.base %>/'
            expand: true
            src: ['fonts/**']
          ,
            cwd: '<%= dirs.bower.glyphicons %>/'
            dest: '<%= dirs.target.base %>/'
            expand: true
            src: ['fonts/**']
        ]
    dirs:
      bower:
        base: 'bower_components'
        fontAwesome: '<%= dirs.bower.base %>/font-awesome'
        glyphicons: '<%= dirs.bower.base %>/bootstrap/fonts'
        jquery: '<%= dirs.bower.base %>/jquery'
        imagesloaded: '<%= dirs.bower.base %>/imagesloaded'
        unveil: '<%= dirs.bower.base %>/unveil'
        Vaguejs: '<%= dirs.bower.base %>/Vague.js'
      src:
        base: 'src'
        coffee: '<%= dirs.src.base %>/coffee'
        images: '<%= dirs.src.base %>/images'
        less: '<%= dirs.src.base %>/less'
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
    less:
      options:
        paths: ['<%= dirs.bower.base %>', '<%= dirs.src.less %>']
      website:
        files:
          '<%= dirs.target.css %>/styles.css': '<%= dirs.src.less %>/main.less'
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
      less:
        files: '<%= dirs.src.less %>/*.less'
        tasks: ['less:website']

  grunt.registerTask 'default', ['website']
  grunt.registerTask 'website', [
    'clean:website', 'coffee:website', 'concat:website', #'uglify:website',
    'imagemin:website', 'copy:website', 'less:website'
  ]
  grunt.registerTask 'deploy', ['website', 'copy:deploy']

# vim:set ts=2 sw=2 sts=2:
