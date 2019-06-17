require 'open-uri'
require 'nokogiri'

class Api::V1::DoutorsController < ApplicationController
  def index
    @lists = []
    url = "https://www.doutor.co.jp"

    # 季節のおすすめ
    Scrapes::SearchService.new.run('https://www.doutor.co.jp/dcs/menu/season.html', '.dcs-season-product') do |node|
      keys = ["name", "image", "link"]

      values = []
      values << node.css(".fs_middle_s").inner_html
      values << (url + node.css('img').attribute('src').value)
      values << "https://www.doutor.co.jp/dcs/menu/season.html"    
      
      @lists << Hash[keys.collect.zip(values)]    
    end

    # デザート
    Scrapes::SearchService.new.run('https://www.doutor.co.jp/dcs/menu/list/sweets.html', '.dcs-menu-list-li') do |node|
      keys = ["name", "image", "price", "link"]

      if node.css("img").attribute("src").present?
        values = []
        values << node.css("h2.dcs-menu-list-block-title").inner_html
        values << (url + node.css("img").attribute("src").value)
        values << node.css(".pprice").inner_html
        values << "https://www.doutor.co.jp/dcs/menu/list/sweets.html"

        @lists << Hash[keys.collect.zip(values)]
      end 
    end

    # アイスドリンク
    Scrapes::SearchService.new.run('https://www.doutor.co.jp/dcs/menu/list/icedrink.html', '.dcs-menu-list-li') do |node|
      keys = ["name", "image", "price", "link"]

        values = []
        values << node.css("h2.dcs-menu-list-block-title").inner_html
        values << (url + node.css("img").attribute("src").value)
        values << node.css(".pprice").inner_html
        values << "https://www.doutor.co.jp/dcs/menu/list/icedrink.html"

        @lists << Hash[keys.collect.zip(values)]
    end

    # ホットドリンク
    Scrapes::SearchService.new.run('https://www.doutor.co.jp/dcs/menu/list/hotdrink.html', '.dcs-menu-list-li') do |node|
      keys = ["name", "image", "price", "link"]

        values = []
        values << node.css("h2.dcs-menu-list-block-title").inner_html
        values << (url + node.css("img").attribute("src").value)
        values << node.css(".pprice").inner_html
        values << "https://www.doutor.co.jp/dcs/menu/list/hotdrink.html"

        @lists << Hash[keys.collect.zip(values)]
    end
  end
end
