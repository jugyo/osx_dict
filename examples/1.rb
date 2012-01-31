require 'osx_dict'

dict = OSXDict::Dictionary.new(:id => 'com.example.Foo', :name => "Foo Dictionary", :filename => 'Foo Dict')
dict.entries << OSXDict::Entry.new(:id => 'foo', :title => 'Foo', :body => <<BODY, :indexes => ['foo', 'Foo'])
<h1>foo</h1>
<p>foo foo foo</p>
BODY
dict.make('./')
