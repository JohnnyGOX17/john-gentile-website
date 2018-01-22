/**
 * @file             : gulpfile.js
 * @author           : John Gentile <johncgentile17@gmail.com>
 * Date              : 20.01.2018
 * Last Modified Date: 20.01.2018
 * Last Modified By  : John Gentile <johncgentile17@gmail.com>
 */

// Required npm plugins
var gulp = require('gulp'),
  child = require('child_process'),
  log = require('fancy-log'),
  browserSync = require('browser-sync').create();

// Where Jekyll builds files
const siteRoot = '_site';

gulp.task('jekyll', () => {
  const jekyll = child.spawn('jekyll', ['serve',
    '--watch',
    '--incremental',
    '--drafts'
  ]);

  const jekyllLogger = (buffer) => {
    buffer.toString()
      .split(/\n/)
      .forEach((message) => log('Jekyll: ' + message));
  };

  jekyll.stdout.on('data', jekyllLogger);
  jekyll.stderr.on('data', jekyllLogger);
});

gulp.task('serve', () => {
  browserSync.init({
    files: [siteRoot + '/**'],
    port: 4000,
    server: {
      baseDir: siteRoot
    }
  });
});

gulp.task('default', ['jekyll', 'serve']);
