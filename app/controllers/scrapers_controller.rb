class ScrapersController < ApplicationController

  def urlscrap
    require 'openssl'
    require 'open-uri'

    failures = []
    @categories = ['salad', 'pasta', 'chicken', 'vegan', 'fish'].each do |categ|

      doc = Nokogiri::HTML(open("https://www.allrecipes.com/search/results/?wt=#{categ}&sort=re", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

      urls = doc.css('div.grid-card-image-container a').map { |link| link['href'] }

      urls.each do |url|
        next if url.include?('video')

        new_url = Url.new(url: url, category: categ)
        unless new_url.save
          failures << new_url.url 
          next
        end
      end
    end

    render template: 'scrapers/url'
  end

  def recipe_scrap
    require 'openssl'
    require 'open-uri'

    # urls = Url.all
    urls = Url.where(['category = ?', 'chicken'])

    failures = []

    @recipes = []
    urls.each_with_index do |url, i|
      # debugger
      img_src = ''
      title = ''
      ingreds = []
      directions = []
      time = 0
      words = []

      # next if url.url.include?('video')

      doc = Nokogiri::HTML(open(url.url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
      
      # ingredients

      ingred_values = helpers.ingred_selector(doc, url)
      next unless ingred_values 
      ingred_sel = ingred_values[0]

      # title

      fillers = ['with', 'to', 'for', 'and', 'very','yummy', 'awesome', 'great', 'very', 'best','amazing', 'the', 'on', 'to']
      title = doc.css('h1').first.text.downcase
      words = title.split(' ').reject { |word| fillers.include?(word)}

      # directions 

      dir_values = helpers.dir_selector(doc, url)
      next unless dir_values
      dir_sel = dir_values[0]

      # image_src 


      img_values = helpers.img_selector(doc, url)
      next unless img_values
      img_src = img_values[0]
      img_src = img_src.is_a?(Array) ? img_src[0] : img_src
      debugger unless img_src.is_a?(String)

      # time


      # time_values = helpers.time_selector(doc, url)
      # next unless time_values
      # time_arr = time_values[0]
      # time = time_arr.include?('h') ? (time_arr[0].to_i * 60) : time_arr[0].to_i


      ingreds = ingred_sel.map { |span| span.text }.map { |el| el.split(' ').reject { |el| el == "\n" || el.include?(' ') }.join(' ') }
      ingreds = ingreds.reject { |el| el.length <= 1 || el.include?('ingredients') }
      ingred_words = helpers.ingred_parse(ingreds).uniq

      num_ingred = ingreds.length 

      directions = dir_sel.map { |span| span.text }
      directions = directions.reject { |el| el.length <= 1 }

      cal = doc.css('span.calorie-count > span:first-child').text

      unless img_src && directions && ingreds
        debugger 
        next 
      end

      recipe = Recipe.new({title: title, url_id: url.id, main: url.category, 
                          directions: directions, img_src: img_src,
                          keywords: words, num_ingred: num_ingred, 
                          num_dir: directions.length, time: time, cal: cal })
      
      if recipe.save  && url.category == 'vegan'     
        ingredient = Ingredient.create({items: ingreds, words: ingred_words, main: url.category,
                                  recipe_id: recipe.id, vegan: true})
        @recipes << recipe 
      elsif recipe.save
        ingredient = Ingredient.create({items: ingreds, words: ingred_words, main: url.category,
                                  recipe_id: recipe.id})
        @recipes << recipe
      else 
        debugger
        failures << url.url 
      end
    end

    debugger
    render template: 'scrapers/home'
    
  end
end

      # ingredients

      # if doc.css('span.recipe-ingred_txt').length > 0
      #   ingred_sel = doc.css('span.recipe-ingred_txt')
      # elsif doc.css('span.ingredients-item-name').length > 0
      #   ingred_sel = doc.css('span.ingredients-item-name')
      # elsif url.url.include?('video')
      #   new_url = doc.css('a.btns-one-large').map { |link| link['href'] }.first
      #   url.update_attribute(:url, new_url)
      #   doc = Nokogiri::HTML(open(new_url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))   
      #   if doc.css('span.recipe-ingred_txt').length > 0
      #     ingred_sel = doc.css('span.recipe-ingred_txt')
      #   elsif doc.css('span.ingredients-item-name').length > 0
      #     ingred_sel = doc.css('span.ingredients-item-name')
      #   else 
      #     next 
      #   end
      # else 
      #   next
      # end

      # directions 

      # if doc.css('span.recipe-directions__list--item').length > 0
      #   dir_sel = doc.css('span.recipe-directions__list--item')
      # elsif doc.css('div.section-body p').length > 0
      #   dir_sel = doc.css('div.section-body p')
      # else 
      #   debugger
      #   next
      # end

      # image_src 

      # if doc.css('img.rec-photo').length > 0
      #   img_src = doc.css('img.rec-photo').map { |img| img['src'] }
      #   img_src = img_src.is_a?(Array) ? img_src[0] : img_src
      # elsif doc.css('div.inner-container > img').length > 0
      #   img_src = doc.css('div.inner-container > img').attr('src').value
      # elsif doc.css('div.inner-container js-inner-container  image-overlay img').length > 0
      #   img_src = doc.css('div.inner-container js-inner-container  image-overlay img').attr('src').value
      # else
      #   debugger
      # end


      # time

      # if doc.css('span.read-in-time')
      #   time_arr = doc.css('span.read-in-time').text.downcase.split(' ')
      #   time = time_arr.include?('h') ? (time_arr[0].to_i * 60) : time_arr[0].to_i
      # elsif doc.css('div.recipe-meta-item-body')
      #   time_arr = doc.css('div.recipe-meta-item-body').select { |el| el.text.include?('h') || el.text.include?('m')}.first.text.split(' ').reject { |el| el == ' ' }
      #   time = time_arr.include?('h') ? (time_arr[0].to_i * 60) : time_arr[0].to_i
      # else
      #   debugger
      # end