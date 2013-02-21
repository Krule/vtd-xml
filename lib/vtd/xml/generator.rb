# encoding: utf-8
module VTD
  module Xml
    class Generator
      GENERATORS = [:products, :books]

      def initialize(root)
        @root = root
      end

      def generate
        GENERATORS.each do |generator_name|
          open(generator_name, &method(generator_name))
        end
      end

      private

      def open(generator_name, &writer)
        File.open(fixture_path(generator_name), 'w', &writer)
      end

      def fixture_path(generator_name)
        File.join(@root, "#{generator_name}.xml")
      end

      def products(f)
        f.puts '<?xml version="1.0" encoding="utf-8"?>'
        f.puts '<container>'

        1_000_000.times do |i|
          f.puts %(  <outer id="#{i + 10}">)
          f.puts %(    <inner id="#{i}" name="Could be random #{i}" />)
          f.puts %(  </outer>)
        end

        f.puts '</container>'
      end

      def books(f)
        f.puts \
          '<?xml version="1.0" encoding="utf-8"?>',
          '<books>',
          '  <book title="A Tale of Two Cities" sold="200000000" firstPublished="1859" rank="1">',
          '    <author name="Charles Dickens" />',
          '    <language>English</language>',
          '    <publisher>Chapman &amp; Hall</publisher>',
          '    <ratings>',
          '      <rating userID="1">5</rating>',
          '      <rating userID="4">2</rating>',
          '      <rating userID="2">3</rating>',
          '    </ratings>',
          '  </book>',
          '  <book title="The Lord of the Rings" sold="150000000" firstPublished="1954" rank="2">',
          '    <author name="J. R. R. Tolkien" />',
          '    <language>English</language>',
          '    <publisher>George Allen &amp; Unwin</publisher>',
          '    <ratings>',
          '      <rating userID="1">5</rating>',
          '      <rating userID="4">4</rating>',
          '      <rating userID="2">5</rating>',
          '    </ratings>',
          '  </book>',
          '  <book title="The Little Prince" sold="140000000" firstPublished="1943" rank="3">',
          '    <author name="Antoine de Saint-Exupéry" />',
          '    <language>French</language>',
          '    <publisher>Gallimard</publisher>',
          '    <ratings>',
          '      <rating userID="4">4</rating>',
          '      <rating userID="2">2</rating>',
          '      <rating userID="1">3</rating>',
          '    </ratings>',
          '  </book>',
          '</books>'
      end
    end
  end
end
