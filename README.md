osx_dict
====

Make your own dictionary for MacOSX!

Install
----

    gem install osx_dict

Example
----

    require 'osx_dict'

    dict = OSXDict::Dictionary.new(:id => 'com.example.Foo', :name => "Foo Dictionary", :filename => 'Foo Dict')

    dict.add_entry(:id => 'foo', :title => 'Foo', :indexes => ['foo', 'Foo'], :body => <<BODY)
    <h1>foo</h1>
    <p>foo foo foo</p>
    BODY

    dict.add_entry(:id => 'bar', :title => 'Bar', :indexes => ['bar', 'Bar'], :body => <<BODY)
    <h1>bar</h1>
    <p>bar bar</p>
    BODY

    dict.make('./')

Copyright
----

Copyright (c) 2012 jugyo, released under the MIT license
