# vtd-xml

Parse large amounts of XML quickly and easily.

**This library currently only works with JRuby.**

## Installation

Add this line to your application's Gemfile:

    gem 'vtd-xml', '~> 0.0.1'

And then execute:

    bundle

Or install it yourself as:

    gem install vtd-xml

## Usage

With the following example XML:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<books>
  <book title="A Tale of Two Cities" sold="200000000" firstPublished="1859">
    <author name="Charles Dickens" />
  </book>
  <book title="The Lord of the Rings" sold="150000000" firstPublished="1954">
    <author name="J. R. R. Tolkien" />
  </book>
  <book title="The Little Prince" sold="140000000" firstPublished="1943">
    <author name="Antoine de Saint-Exupéry" />
  </book>
</books>
```

### Parsing a file

``` ruby
require 'vtd-xml'

# Create a parser
parser = VTD::Xml::Parser.new 'path/to.xml'

# This shortcut does the same
parser = VTD::Xml.open 'path/to.xml'

parser.find('//book/author') do |node|
  # Iterates through each node
end
```

### Working with attributes

``` ruby
node = parser.find('//book/author[1]').first
# Accessing attributes
node['name']

node.fetch('missing', 'so use this default')
node.fetch('another-missing') { 'so call this block and use it' }

node.slice('title', 'missing')
# => {'title' => 'A Tale of Two Cities',  'missing' => nil}

node.attributes # => returns every attribute
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
