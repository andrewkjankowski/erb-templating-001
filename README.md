# Templating with ERB

## Description

In this lab, you'll practice generating a simple site using ERB (Embedded Ruby). First, you'll create an index page by manually building up a string of html. Then, because that's a real pain in the butt, you'll use ERB to generate an html page each for about 25 movies.

## Instructions

### Movie Specs

Before anything, you're going to need to create a simple Movie class. Instances of this class will have some basic attributes (title, release date, director, and summary). The class itself will need to implement a method that parses through a text file and creates Movie instances based upon the data in that file. Data does not need to be persisted in a database.

### #url
In the URI standard there are reserved characters and unsafe characters. The purpose of these reserved characters is to provide a set of delimiting characters that are distinguishable from other data within a URL. The unsafe characters can easily be misunderstood within your URL which can cause vulnerabilities such as HTML-injection and SQL-injection. You'll want to either remove these characters completely or better yet convert them to their encoded counterpart. For example `'` turns into `%27` and '&' turns into '%26'.

Check out this awesome blog post on [URL Encoding](http://www.blooberry.com/indexdot/html/topics/urlencoding.htm). 

#### SiteGenerator Specs

#### #make_index!

You'll create a class, SiteGenerator, that is reponsible for, well, generating our site. You won't be jumping directly into using ERB righ away, though. The first method you'll need to write is `make_index!`. This method will, based upon your Movie instances, generate an index page. (Note: You will have to pay very close attention to formatting!)

For this method, you will build up a string and manually write it to a file, `_site/index.html`. It's going to be difficult to match the formatting that the test expects, but you can do it!

#### #generate_pages!

At this point, you should probably be annoyed about that whole `make_index!` method. Building up a string like that is lame. So we aren't going to be doing that again. For the `generate_pages!` method, you'll want to create an ERB template (in `lib/templates/movie.html.erb`) and use it to generate a page for each Movie instance. You should use one ERB instance inside of your block.

Remember that you'll need to pass your current `binding` as an argument to the `ERB#result` method like this:

```ruby
template.result(binding)
```

### Generate the Site!

Once you've passed all of the specs, your site generator should work. Run `bin/generate` from your command line and then `open _site/index.html` to check it out.

## Resources
* [Ruby Docs](http://www.ruby-doc.org/) - [Class: ERB](http://www.ruby-doc.org/stdlib-2.1.1/libdoc/erb/rdoc/ERB.html)
* [Ruby Docs](http://www.ruby-doc.org/) - [URI::Escape](http://ruby-doc.org/stdlib-2.1.1/libdoc/uri/rdoc/URI/Escape.html)
* [Blooberry](http://www.blooberry.com/indexdot/html/index.html) - [URL Encoding](http://www.blooberry.com/indexdot/html/topics/urlencoding.htm)
* [Perishable Press](https://perishablepress.com/) - [Unsafe Characters](https://perishablepress.com/stop-using-unsafe-characters-in-urls/)
<p data-visibility='hidden'>View <a href='https://learn.co/lessons/erb-templating' title='Templating with ERB'>Templating with ERB</a> on Learn.co and start learning to code for free.</p>
