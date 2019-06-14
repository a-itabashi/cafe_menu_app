require 'open-uri'
require 'nokogiri'

class Api::V1::MoviesController < ApplicationController
  def index
    @names = []
    @images = []
    @prices = []
    @links = []
    Movies::SearchService.new.run('https://www.starbucks.co.jp/new/lineup/?nid=mm&mode=cafe_pc_002', '.recommend') do |node|
      @names << node.css('.productName').inner_html
      @images << node.css('img').attribute('data-original').value
      @prices << node.css('.productPrice').inner_html
      @links << node.css('a').attribute('href').value
    end
  end
end