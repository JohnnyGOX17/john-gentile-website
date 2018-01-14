---
layout: default
title: Website Design
kb: true
top-category: Software Engineering
comments: true
---

{% include header.html %}

A good starting point might be to check out the tutorials and reference over at [w3schools.com](https://www.w3schools.com/)

* [Google Web Fundamentals](https://developers.google.com/web/fundamentals/)

## Page Layout

### Examples

* [HTML5 Boilerplate](https://html5boilerplate.com/)
* [HTML5 UP](https://html5up.net/)
* [jQuery-menu-aim](https://github.com/kamens/jQuery-menu-aim): jQuery plugin for dropdown menus that can differentiate between a user trying to hover over a dropdown item vs trying to navigate into a submenu's contents.

### Icons

* [Font Awesome](http://fontawesome.io/icons/): Large selection of vector graphic icons as well as brand icons
* [Google Material Icons](http://google.github.io/material-design-icons/): Google icons for standard icons and large CDN distribution

## Content

### Markdown

* [GiHub-Style Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
    - To see a complete list of syntax highlighting for various languages in GitHub Markdown, see the supported tags in [linguist](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml)
    - If using [Jekyll](https://jekyllrb.com/), the [Rouge](http://rouge.jneen.net/) syntax highlighter is used. To wrap a block of text to be syntax highlighted you must use liquid tags around the text:

{% raw %}
{% highlight ruby linenos %}

def foo
  puts 'foo'
end

{% endhighlight %}
{% endraw %}

A full list of applicable short names for syntax highlighting can be found on the [Rogue wiki](https://github.com/jneen/rouge/wiki/List-of-supported-languages-and-lexers).
Note that a custom/unique syntax stylesheet might need to be used to color the applied syntax classes the lexer applies.

* To embed LaTeX or other [MathJax](https://www.mathjax.org/) capable equations and symbols, use `$` symbols like `$ \some \math \commands $` to put rendered equations inline
    - Use double `$$` symbols to have a formula appear on it's own new line
    - For kramdown, double dollarsigns actually represent math that will go inline with text. To have math statements appear on a newline (i.e. not inline), use escaped dollar signs such as `\$\$ 5 + 5 $$`
    - It's also useful to use online LaTeX editors like [CodeCogs](https://www.codecogs.com/latex/eqneditor.php)
* [kramdown Syntax](https://kramdown.gettalong.org/syntax.html): kramdown is used in [Jekyll](#Jekyll)
* [LaTeX](https://en.wikibooks.org/wiki/LaTeX)

### Graphing & Charts

* [Frappé Charts](https://frappe.github.io/charts/) simple and modern charting, integrates with `npm`

## Code & Tools

* [Google Developer Tools](https://developers.google.com/web/tools/setup/setup-buildtools#dont-trip-up-with-vendor-prefixes)
* [Web Style Guide](http://www.webstyleguide.com/)

A popular Javascript task runner is [Grunt](https://gruntjs.com/) which keeps versioning of plugins and can automate a variety of tasks.

### npm Packages

* [uglify-js](https://www.npmjs.com/package/uglify-js): JavaScript parser, minifier, compressor and beautifier toolkit.
* [grunt-html](https://www.npmjs.com/package/grunt-html): Grunt plugin for HTML validation
* [bootlint](https://github.com/twbs/bootlint)

### Google Tools

* [Analytics](https://analytics.google.com/): Easy website tracking and analytics that can be added to any website (including this one).
* [PageSpeed Tools](https://developers.google.com/speed/pagespeed/): Analyze websites and pages and recommends actions to make pages faster and more optimized.

## Frameworks & Site Generators

### Frameworks

* [Node.js](https://nodejs.org/en/) is a JavaScript runtime built on Chrome's V8 engine that is light and efficient.
* [Django](https://www.djangoproject.com/) is a high-level Python web framework that promotes rapid development and design.
* [Mobirise](https://mobirise.com/) generates static website content (HTML + CSS) in a quick and easy interface

### Jekyll

* [Jekyll](https://jekyllrb.com/)
* [Jekyll & Liquid Cheatsheet](https://gist.github.com/smutnyleszek/9803727)

## SEO (Search Engine Optimization)

The goal for many websites is to attract the most amount of viewers (and the right targeted audience) as possible. Since most people start their information finding journey on search engines, websites should optimize their design to better be categorized by search engines and/or show up higher in search results. The main drivers of a site with good SEO is:
* _Lots of Good Content:_ Search engines purposefully rank and categorize websites and their content based on what humans want and are looking for. Therefore, the most important part of SEO is to write lots of valuable content that is inline with the purpose of the website. This means writing lots of informational pages that people will want to read.
* _Linking & Layout:_ 
* _Site Speed:_ The time it takes for a site to load is not only a metric for users in the usability of a site but search engines also quantify this to rank websites (with faster load times ranking higher). There are some basics to optimizing site speed, such as minimizing resources or server side improvements, but a quick and thorough way to check what parts of a site could be improved is to use site speed tools such as:
  + [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/)
  + [Pingdom](https://tools.pingdom.com/)
  + [GTmetrix](https://gtmetrix.com/)
  + [WebPageTest](http://www.webpagetest.org/)
  + [Lighthouse](https://developers.google.com/web/tools/lighthouse/)
* _Encryption:_ As more and more users expect some level of encryption when interacting with websites they visit, search engines give an indexing boost to websites that provide HTTPS encryption.
