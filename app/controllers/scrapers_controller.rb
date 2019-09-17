class ScrapersController < ApplicationController

  def urlscrap
    require 'openssl'
    require 'open-uri'

    @categories = ['salad', 'pasta', 'chicken', 'vegan', 'fish'].each do |categ|
      doc = Nokogiri::HTML(open("https://www.allrecipes.com/search/results/?wt=#{categ}&sort=re", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

      urls = doc.css('div.grid-card-image-container a').map { |link| link['href'] }

      urls.each do |url|
        new_url = Url.new(url: url, category: categ)
        unless new_url.save
          next
        end
      end
    end

    render template: 'scrapers/url'
  end

  def recipe_scrap
    require 'openssl'
    require 'open-uri'

    urls = Url.where(["category = ?", "chicken"]) 

    @recipes = []
    urls.each do |url|
      doc = Nokogiri::HTML(open(url.url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
      
      fillers = ['with', 'to', 'for', 'and', 'very','yummy', 'awesome', 'great', 'very', 'best','amazing', 'the', 'on', 'to']
      title = doc.css('h1').text.downcase
      words = title.split(' ').reject { |word| fillers.include?(word)}

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
      num_ingred = ingreds.length 

      directions = selector2.map { |span| span.text }
      directions = directions.reject { |el| el.length <= 1 }

      if doc.css('img.rec-photo').length > 0
        img_src = doc.css('img.rec-photo').map { |img| img['src'] }
        img_src = img_src.is_a?(Array) ? img_src[0] : img_src
      elsif doc.css('div.inner-container > img').length > 0
        img_src = doc.css('div.inner-container > img').attr('src').value
      else
        debugger
      end

      if doc.css('span.read-in-time')
        time_arr = doc.css('span.read-in-time').text.downcase.split(' ')
        time = time_arr.include?('h') ? (time_arr[0].to_i * 60) : time_arr[0].to_i
      elsif doc.css('div.recipe-meta-item-body')
        time_arr = ('div.recipe-meta-item-body').text.downcase.split(' ').reject(' ')
        time = time_arr.include?('h') ? (time_arr[0].to_i * 60) : time_arr[0].to_i
      else
        debugger
      end


      # time_arr = doc.css('span.read-in-time').text.downcase.split(' ')
      # time = time_arr.include?('h') ? (time_arr[0].to_i * 60) : time_arr[0].to_i

      cal = doc.css('span.calorie-count > span:first-child').text

      # debugger
      unless img_src && time && cal
        debugger
        next 
      end

      recipe = Recipe.new({title: title, url_id: url.id, main: url.category, 
                          directions: directions, img_src: img_src,
                          keywords: words, num_ingred: num_ingred, 
                          num_dir: directions.length, time: time, cal: cal })
      
      if recipe.save
        
        ingredient = Ingredient.create({items: ingreds, main: url.category,
                                  recipe_id: recipe.id})
        @recipes << recipe 
      end



    end

    render template: 'scrapers/home'
    
  end
end
