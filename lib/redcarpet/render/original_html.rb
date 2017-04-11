class Redcarpet::Render::OriginalHTML < Redcarpet::Render::HTML
  def postprocess(full_document)
    full_document.gsub(/\[gist:(.+)\]/, '<script src="https://gist.github.com/\1.js"></script>')
  end
end
