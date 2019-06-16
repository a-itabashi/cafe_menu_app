require 'open-uri'
require 'nokogiri'

class Api::V1::DoutorsController < ApplicationController
  def index
    @lists = []
    url = "https://www.doutor.co.jp"

    
    Scrapes::SearchService.new.run('https://www.doutor.co.jp/dcs/menu/season.html', '.dcs-season') do |node|
      

      # binding.pry

      keys = ["name", "image",]

      values = []
      values << node.css('.dcs-season-product .fw_bold').inner_html

      values << (url + node.css('.dcs-season-product img').attribute('src').value)
      
      
      @lists << Hash[keys.collect.zip(values)]    
    end
  end
end
