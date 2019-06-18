module Scrapes
  class SearchService
    def run(url, pattern, &block)
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end
      doc = Nokogiri::HTML.parse(html, nil, charset)
      doc.css(pattern).each do |node|
        block.call(node)
      end
    end
  end
end
