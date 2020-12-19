/**
 * @file             : gulpfile.js
 * @author           : John Gentile <johncgentile17@gmail.com>
 * Date              : 20.01.2018
 * Last Modified Date: 06.03.2018
 * Last Modified By  : John Gentile <johncgentile17@gmail.com>
 */

// Required npm plugins
var gulp = require('gulp'),
  imagemin = require('gulp-imagemin'),
  uglify = require('gulp-uglify'),
  pump = require('pump'),
  todo = require('gulp-todo'),
  htmlmin = require('gulp-htmlmin'),
  nano = require('gulp-cssnano'),
  uncss = require('gulp-uncss');

// Minimize and optimize CSS
gulp.task('css', done => {
  return gulp.src('./_site/**/*.css')
    // uncss still too finicky with our CSS for some reason...
    //.pipe(uncss({
      // Use running website as other HTML input so as generated styles from
      // TOC sidebar can be seen by uncss: https://github.com/uncss/uncss
    //  html: ['./_site/**/*.html', 'https://john-gentile.com/kb/tools-techniques/Git.html']
    //}))
    .pipe(nano())
    .pipe(gulp.dest('dist'));
  done();
});

// Generate TODO.md from source files
gulp.task('todo', done => {
  gulp.src(['./**/*.{css,html,js}', '!node_modules/', '!node_modules/**'])
    .pipe(todo())
    .pipe(gulp.dest('./'));
  done();
});

// Minimize images
gulp.task('minify-img', done => {
  gulp.src('./_site/**/*.{gif,jpeg,jpg,png,svg}')
    .pipe(imagemin([
      // https://github.com/imagemin/imagemin-gifsicle
      imagemin.gifsicle({optimizationLevel: 3}),
      // v7.0.0 replaced https://github.com/imagemin/imagemin-jpegtran
      imagemin.mozjpeg({progressive: true}),
      // https://github.com/imagemin/imagemin-optipng
      imagemin.optipng({optimizationLevel: 5})
      // https://github.com/svg/svgo#what-it-can-do
    ], { verbose: true }
    ))
    .pipe(gulp.dest('dist'))
  done();
});

// Minimize final JavaScript: see options https://github.com/mishoo/UglifyJS2#minify-options
gulp.task('minify-js', function (cb) {
  pump([
    gulp.src('./_site/**/*.js'),
    uglify(),
    gulp.dest('dist')
  ],
  cb
  );
});

// Minimize final HTML: see options https://github.com/kangax/html-minifier
gulp.task('minify-html', done => {
  return gulp.src('./_site/**/*.html')
    .pipe(htmlmin({collapseWhitespace: true, minifyCSS: true, minifyJS: true, removeComments: true}))
    .pipe(gulp.dest('dist'));
  done();
});

// Move over all other files
gulp.task('move-files', done => {
  console.log("Moving PDF, txt and XML intermediate files to distribution.");
  gulp.src('./_site/*.{pdf,txt,webmanifest,xml}')
    .pipe(gulp.dest('./dist'));
  done();
});
