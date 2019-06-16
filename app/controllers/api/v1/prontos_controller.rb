require 'open-uri'
require 'nokogiri'

class Api::V1::ProntosController < ApplicationController
  def index
    @lists = []
    url = "https://www.pronto.co.jp"
    
    # カフェドリンク
    Scrapes::SearchService.new.run('https://www.pronto.co.jp/menu/cafedrink/', '.recomendList li') do |node|
      keys = ["name", "image", "price", "link"]

      values = []
      values << node.css(".recomendTitle h4 a").inner_html
      values << (url + node.css('img').attribute('src').value)
      values << node.css(".recomendTitle .recomendPrice").inner_html
      values << (url + node.css(".recomendTitle h4 a").attribute("href").value)
      
      @lists << Hash[keys.collect.zip(values)]
    end

    # カフェフード
    Scrapes::SearchService.new.run('https://www.pronto.co.jp/menu/cafefood/', '#menuContents li') do |node|
      keys = ["name", "image", "price", "link"]

      values = []
      values << node.css("h4").inner_html
      values << (url + node.css('img').attribute('src').value)
      values << node.css('.price').inner_html
      values << (url + node.css("a").attribute("href").value)
      
      @lists << Hash[keys.collect.zip(values)]
    end

    # バードリンク
    Scrapes::SearchService.new.run('https://www.pronto.co.jp/menu/bardrink/', '.recomendList li') do |node|
      keys = ["name", "image", "price", "link"]

      values = []
      values << node.css(".recomendTitle h4 a").inner_html
      values << (url + node.css('img').attribute('src').value)
      values << node.css(".recomendTitle .recomendPrice").inner_html
      values << (url + node.css(".recomendTitle h4 a").attribute("href").value)
      
      @lists << Hash[keys.collect.zip(values)]
    end
  end
end
