#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title Settings.title
    xml.description Settings.description
    xml.link Settings.url
    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description do
          xml.cdata! HTML_Truncator.truncate(post.to_html, 1).html_safe
        end
        xml.pubDate post.created_at
        xml.guid blog_friendly_path(post)
        xml.link blog_friendly_path(post)
      end
    end
  end
end
