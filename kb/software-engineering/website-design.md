---
layout: default
title: Website Design
kb: true
top-category: Software Engineering
comments: true
---

## Overview

A good starting point might be to check out the tutorials and reference over at [w3schools.com](https://www.w3schools.com/) or the [Grab Front End Guide](https://github.com/grab/front-end-guide) or [Google Web Fundamentals](https://developers.google.com/web/fundamentals/).

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

```
{% raw %}
{% highlight ruby linenos %}

def foo
  puts 'foo'
end

{% endhighlight %}
{% endraw %}
```

A full list of applicable short names for syntax highlighting can be found on the [Rogue wiki](https://github.com/jneen/rouge/wiki/List-of-supported-languages-and-lexers).
Note that a custom/unique syntax stylesheet might need to be used to color the applied syntax classes the lexer applies.

* To embed LaTeX or other [MathJax](https://www.mathjax.org/) capable equations and symbols, use `$` symbols like `$ \some \math \commands $` to put rendered equations inline
    - Use double `$$` symbols to have a formula appear on it's own new line
    - For kramdown, double dollarsigns actually represent math that will go inline with text. To have math statements appear on a newline (i.e. not inline), use escaped dollar signs such as `\$\$ 5 + 5 \$\$`
    - It's also useful to use online LaTeX editors like [CodeCogs](https://www.codecogs.com/latex/eqneditor.php)
* [kramdown Syntax](https://kramdown.gettalong.org/syntax.html): kramdown is used in [Jekyll](#Jekyll)
* [LaTeX](https://en.wikibooks.org/wiki/LaTeX)

### Graphing & Charts

* [Frappé Charts](https://frappe.github.io/charts/) simple and modern charting, integrates with `npm`

### Fonts

* [Google Fonts](https://fonts.google.com/)

## Code & Tools

* [Google Developer Tools](https://developers.google.com/web/tools/setup/setup-buildtools#dont-trip-up-with-vendor-prefixes)
* [Web Style Guide](http://www.webstyleguide.com/)
* [Learn Web Development- MDN](https://developer.mozilla.org/en-US/docs/Learn)
* [Sass](http://sass-lang.com/) CSS extension language and generator

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
* [Electron](https://electronjs.org/) cross-platform JavaScript framework for building desktop and web applications with JS, HTML and CSS.

### Jekyll

[Jekyll](https://jekyllrb.com/) is a static site generator that can easily create scalable websites using a combination of pages with [YAML Front Matter](https://jekyllrb.com/docs/frontmatter/) and [Liquid tags/expressions](https://github.com/Shopify/liquid/wiki/liquid-for-designers) for dynamic generation.
* [Jekyll & Liquid Cheatsheet](https://gist.github.com/smutnyleszek/9803727)

## SEO (Search Engine Optimization)

The goal for many websites is to attract the most amount of viewers (and the right targeted audience) as possible. Since most people start their information finding journey on search engines, websites should optimize their design to better be categorized by search engines and/or show up higher in search results. The main drivers of a site with good SEO is:
* _Lots of Good Content:_ Search engines purposefully rank and categorize websites and their content based on what humans want and are looking for. Therefore, the most important part of SEO is to write lots of valuable content that is inline with the purpose of the website. This means writing lots of informational pages that people will want to read.
* _Linking & Layout:_ Sites that are easier to crawl and are determined to be easy to use for end users rank higher. This means having nicely structured menus and links that network together your site help here.
* _Structured Data:_ Structured data is used by search engines to get useful metadata about your website beyond traditional `<meta>` tags in your header. This can come in a large variety of forms depending on your intended audience and site type but generally inserting [JSON](https://www.json.org/) data in [Schema](http://schema.org/docs/about.html) compliant forms or using the [Facebook Open Graph Protocol](http://ogp.me/) tags is enough here.
* _Site Speed:_ The time it takes for a site to load is not only a metric for users in the usability of a site but search engines also quantify this to rank websites (with faster load times ranking higher). There are some basics to optimizing site speed, such as minimizing resources or server side improvements, but a quick and thorough way to check what parts of a site could be improved is to use site speed tools such as:
  + [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/)
  + [Pingdom](https://tools.pingdom.com/)
  + [GTmetrix](https://gtmetrix.com/)
  + [WebPageTest](http://www.webpagetest.org/)
  + [Lighthouse](https://developers.google.com/web/tools/lighthouse/)
* _Encryption:_ As more and more users expect some level of encryption when interacting with websites they visit, search engines give an indexing boost to websites that provide HTTPS encryption.
* _Mobile Friendly:_ Similar to having a fast, easy to use website, as mobile device use increases across the world, search engines are purposefully ranking "mobile friendly" sites higher than sites that do not have responsive designs or are heavy on ads and external content. Projects like Google's [AMP](https://www.ampproject.org/) (see [examples here of AMP](https://ampbyexample.com/)) and [Progressive Web App Checklist](https://developers.google.com/web/progressive-web-apps/checklist) provide guidelines for creating websites that are well suited for mobile users.

### Hosting

There are many, many options for website hosting, especially depending on your website needs (e.x. performance, static vs. dynamic websites, cost, etc.). This site is benefitting from hosting on an Amazon Web Service S3 bucket and content distribution with [Amazon Cloudfront](https://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-cloudfront-walkthrough.html). This allows for super fast and cheap static website delivery as well as a simple solution for [HTTPS website hosting](https://medium.com/@sbuckpesch/setup-aws-s3-static-website-hosting-using-ssl-acm-34d41d32e394).
