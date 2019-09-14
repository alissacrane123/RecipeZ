class ScrapersController < ApplicationController

  def urlscrap
    require 'openssl'
    require 'open-uri'

    doc = Nokogiri::HTML(open('https://www.allrecipes.com/recipes/96/salad/', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

    @urls = doc.css('div.grid-card-image-container a').map { |link| link['href'] }

    @urls.each do |url|
      new_url = Url.new(url: url, category: 'salad')
      unless new_url.save
        next
      end
    end

    render template: 'scrapers/url'
  end

  def recipe_scrap
    require 'openssl'
    require 'open-uri'

    urls = Url.all.map { |url| url } 

    @recipes = []
    urls.each do |url|
      doc = Nokogiri::HTML(open(url.url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
      
      title = doc.css('h1').text

      if doc.css('span.recipe-ingred_txt')
        selector = doc.css('span.recipe-ingred_txt')
        selector2 = doc.css('span.recipe-directions__list--item')
      elsif doc.css('span.ingredients-item-name')
        selector = doc.css('span.ingredients-item-name')
        selector2 = doc.css('div.section-body p')
      else 
        # url.destroy 
        next
      end
      
      ingreds = selector.map { |span| span.text }
      ingreds = ingreds.reject { |el| el.length <= 1 || el.include?('ingredients') }

      directions = selector2.map { |span| span.text }
      directions = directions.reject { |el| el.length <= 1 }

      recipe = Recipe.new({title: title, url_id: url.id, ingreds: ingreds, directions: directions })

      if recipe.save
        @recipes << recipe 
      end


    end

    render template: 'scrapers/home'
    
  end
end
