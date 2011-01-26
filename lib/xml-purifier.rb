#!/usr/bin/ruby

# file: xml-purifier.rb

require 'rexml/document'
require 'json'
include REXML

class XMLPurifier

  def initialize(options={})

    # options for to: default, native, cdata, escaped
    opt = {xml: '', from: 'json', to: 'native'}.merge(options)

    @doc = Document.new(opt[:xml])

    @doc.root.each_recursive do |elem|

      if elem.text and elem.text.to_s[/^[\{\[][^\}\]]+[\}\]]$/] then

        obj = JSON.parse(elem.text)
        method('to_' + opt[:to].to_s.to_sym).call(elem, obj)
      end
    end
    
  end

  def to_xml()
    @doc.to_s
  end

  private

  def to_default(elem, obj)
    node_xml = "<%s>%s</%s>" % [elem.name, scan_obj_to_xml(obj), elem.name]
    elem.parent.add_element Document.new(node_xml).root
    elem.parent.delete elem    
  end
  
  alias to_native to_default

  def to_cdata(elem, obj)
    s = scan_obj_to_xml(obj) 
    elem.text = CData.new(s)
    elem.add_element(CData.new(s))
  end

  def to_escaped(elem, obj)  elem.text = scan_obj_to_xml(obj)  end

  def string_to_xml(x) x  end

  def hash_to_xml(x)
    x.map do |k,v| 
      k.gsub!(/[^a-zA-Z0-9]/,'_')
      "<%s>%s</%s>" % [k, scan_obj_to_xml(v), k]
    end.join
  end

  def array_to_xml(x)
    x.map {|v| "<element>%s</element>" % scan_obj_to_xml(v)}.join
  end

  def scan_obj_to_xml(o)
    method("%s_to_xml" % o.class.to_s.downcase.to_sym).call(o)
  end

end
