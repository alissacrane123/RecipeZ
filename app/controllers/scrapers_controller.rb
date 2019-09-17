class ScrapersController < ApplicationController

  def urlscrap
    require 'openssl'
    require 'open-uri'

    @categories = ['salad', 'pasta', 'chicken', 'vegan', 'fish'].each do |categ|
      doc = Nokogiri::HTML(open("https://www.allrecipes.com/search/results/?wt=#{categ}&sort=re", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

      urls = doc.css('div.grid-card-image-container a').map { |link| link['href'] }.reject { |url| url.include?('video')}

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

    urls = Url.all

    @recipes = []
    urls.each do |url|
      next if url.url.include?('video')

      doc = Nokogiri::HTML(open(url.url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
      
      fillers = ['with', 'to', 'for', 'and', 'very','yummy', 'awesome', 'great', 'very', 'best','amazing', 'the', 'on', 'to']
      title = doc.css('h1').first.text.downcase
      words = title.split(' ').reject { |word| fillers.include?(word)}

      # ingredients

      if doc.css('span.recipe-ingred_txt').length > 0
        ingred_sel = doc.css('span.recipe-ingred_txt')
      elsif doc.css('span.ingredients-item-name').length > 0
        ingred_sel = doc.css('span.ingredients-item-name')
      else 
        debugger 
        next
      end

      # directions 

      if doc.css('span.recipe-directions__list--item').length > 0
        dir_sel = doc.css('span.recipe-directions__list--item')
      elsif doc.css('div.section-body p').length > 0
        dir_sel = doc.css('div.section-body p')
      else 
        debugger
        next
      end

      # image_src 

      if doc.css('img.rec-photo').length > 0
        img_src = doc.css('img.rec-photo').map { |img| img['src'] }
        img_src = img_src.is_a?(Array) ? img_src[0] : img_src
      elsif doc.css('div.inner-container > img').length > 0
        img_src = doc.css('div.inner-container > img').attr('src').value
      else
        debugger
      end

      # time
      # debugger
      if doc.css('span.read-in-time')
        time_arr = doc.css('span.read-in-time').text.downcase.split(' ')
        time = time_arr.include?('h') ? (time_arr[0].to_i * 60) : time_arr[0].to_i
        # debugger
      elsif doc.css('div.recipe-meta-item-body')
        time_arr = doc.css('div.recipe-meta-item-body').select { |el| el.text.include?('h') || el.text.include?('m')}.first.text.split(' ').reject { |el| el == ' ' }
        time = time_arr.include?('h') ? (time_arr[0].to_i * 60) : time_arr[0].to_i
        # debugger
      else
        debugger
      end

      ingreds = ingred_sel.map { |span| span.text }.map { |el| el.split(' ').reject { |el| el == "\n" || el.include?(' ') }.join(' ') }
      ingreds = ingreds.reject { |el| el.length <= 1 || el.include?('ingredients') }
      num_ingred = ingreds.length 
      # ingreds = 

      directions = dir_sel.map { |span| span.text }
      directions = directions.reject { |el| el.length <= 1 }

      cal = doc.css('span.calorie-count > span:first-child').text

      # debugger
      unless img_src && num_ingred > 1
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
