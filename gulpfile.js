var gulp = require('gulp');
var browserSync = require('browser-sync').create();

var setupWatchers = function() {
  gulp.watch(['./app/views/**/*.erb',
              './app/views/**/*.haml',
              './app/assets/javascripts/**/*.js'], ['reload']);
  gulp.watch(['./app/assets/stylesheets/**/*.scss'], ['reloadCSS'])
};

gulp.task('reload', function(){
  return browserSync.reload();
});

gulp.task('reloadCSS', function() {
  return browserSync.reload('*.css');
});

gulp.task('init', function() {
  browserSync.init({
    proxy: '0.0.0.0:3000',
    port: 8000,
    open: false,
    ui: {
      port: 8001
    },
    snippetOptions: {
      rule: {
        match: /<\/head>/i,
        fn: function (snippet, match) {
          return snippet + match;
        }
      }
    }
  });

  setupWatchers();
});

gulp.task('default', ['init']);