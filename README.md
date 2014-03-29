# Introducing the XML-Purifier gem

    require 'xml-purifier'

    raw_xml = File.open('ruby/summary.xml','r').read
    # option for to: 'default', 'cdata', or 'escaped'
    xml = XMLPurifier.new(xml: raw_xml, from: 'json', to: 'default').to_xml
    # or
    xml = XMLPurifier.new(xml: raw_xml, from: 'json', to: 'cdata').to_xml
    # or
    xml = XMLPurifier.new(xml: raw_xml, from: 'json', to: 'escaped').to_xml

output for default:
<pre>
&lt;summary&gt;
  &lt;type&gt;input&lt;/type&gt;
  &lt;user&gt;jrobertson&lt;/user&gt;
  &lt;id&gt;14&lt;/id&gt;
  &lt;entry1&gt;
    &lt;title&gt;titleddd&lt;/title&gt;
    &lt;body&gt;ppy jelly&lt;/body&gt;
  &lt;/entry1&gt;
  &lt;entry2&gt;
    &lt;title&gt;titleeee&lt;/title&gt;
    &lt;body&gt;ppy jelly2&lt;/body&gt;
  &lt;/entry2&gt;
&lt;/summary&gt;
</pre>
 
output for cdata:
<pre>
&lt;summary&gt;
  &lt;type&gt;input&lt;/type&gt;            
  &lt;user&gt;jrobertson&lt;/user&gt;
  &lt;id&gt;14&lt;/id&gt;
  &lt;entry1&gt;&lt;![CDATA[&lt;title&gt;titleddd&lt;/title&gt;&lt;body&gt;ppy jelly&lt;/body&gt;]]&gt;&lt;/&gt;&lt;/entry1&gt;
  &lt;entry2&gt;&lt;![CDATA[&lt;title&gt;titleeee&lt;/title&gt;&lt;body&gt;ppy jelly2&lt;/body&gt;]]&gt;&lt;/&gt;&lt;/entry2&gt;
&lt;/summary&gt;
</pre>

output for escaped:
<pre>
&lt;summary&gt;
  &lt;type&gt;input&lt;/type&gt;            
  &lt;user&gt;jrobertson&lt;/user&gt;
  &lt;id&gt;14&lt;/id&gt;
  &lt;entry1&gt;&amp;amp;lt;title&amp;amp;gt;titleddd&amp;amp;lt;/title&amp;amp;gt;&amp;amp;lt;body&amp;amp;gt;ppy jelly&amp;amp;lt;/body&amp;amp;gt;&lt;/entry1&gt;
  &lt;entry2&gt;&amp;amp;lt;title&amp;amp;gt;titleeee&amp;amp;lt;/title&amp;amp;gt;&amp;amp;lt;body&amp;amp;gt;ppy jelly2&amp;amp;lt;/body&amp;amp;gt;&lt;/entry2&gt;
&lt;/summary&gt;
</pre>

file used: summary.xml
<pre>
&lt;summary&gt;
  &lt;type&gt;input&lt;/type&gt;            
  &lt;user&gt;jrobertson&lt;/user&gt;
  &lt;id&gt;14&lt;/id&gt;
  &lt;entry1&gt;{&quot;title&quot;:&quot;titleddd&quot;,&quot;body&quot;:&quot;ppy jelly&quot;}&lt;/entry1&gt;
  &lt;entry2&gt;{&quot;title&quot;:&quot;titleeee&quot;,&quot;body&quot;:&quot;ppy jelly2&quot;}&lt;/entry2&gt;
&lt;/summary&gt;</pre>

The XML-Purifier gem can rid embedded JSON leaving only pure XML with JSON being replaced by native, cdata, or escaped XML.

## Resources

* [jrobertson/xml-purifier](https://github.com/jrobertson/xml-purifier)

