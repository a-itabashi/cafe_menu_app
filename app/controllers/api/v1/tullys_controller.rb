require 'open-uri'
require 'nokogiri'

class Api::V1::TullysController < ApplicationController
  def index
    @lists = []
    url = "https://www.tullys.co.jp"

    # ドリンク
    Scrapes::SearchService.new.run('https://www.tullys.co.jp/menu/drink/', '.item_list li') do |node|
      keys = ["name", "image", "link"]

      values = []
      values << node.css("p").inner_html
      values << (url + node.css("img").attribute("src").value)
      values << (url + node.css('a').attribute('href').value)
      
      @lists << Hash[keys.collect.zip(values)]    
    end

    # スイーツ
    Scrapes::SearchService.new.run('https://www.tullys.co.jp/menu/sweets/', '.item_list li') do |node|
      keys = ["name", "image", "link"]

      values = []
      values << node.css("p").inner_html
      values << (url + node.css("img").attribute("src").value)
      values << (url + node.css('a').attribute('href').value)
      
      @lists << Hash[keys.collect.zip(values)]    
    end

    # アイス
    Scrapes::SearchService.new.run('https://www.tullys.co.jp/menu/ice/', '.item_list li') do |node|
      keys = ["name", "image", "link"]

      values = []
      values << node.css("p").inner_html
      values << (url + node.css("img").attribute("src").value)
      values << (url + node.css('a').attribute('href').value)
      
      @lists << Hash[keys.collect.zip(values)]    
    end

  end
end
