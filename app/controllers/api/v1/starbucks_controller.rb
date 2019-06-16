require 'open-uri'
require 'nokogiri'

class Api::V1::StarbucksController < ApplicationController
  def index
    @lists = []
    url = "https://www.starbucks.co.jp"
    
    Scrapes::SearchService.new.run('https://www.starbucks.co.jp/new/lineup/?nid=mm&mode=cafe_pc_002', '.recommend') do |node|
      keys = ["name", "image", "price", "link"]

      values = []
      values << node.css('.productName').inner_html
      values << (url + node.css('img').attribute('data-original').value)
      values << node.css('.productPrice').inner_html
      values << (url + node.css('a').attribute('href').value)
      
      @lists << Hash[keys.collect.zip(values)]    
    end
  end
end