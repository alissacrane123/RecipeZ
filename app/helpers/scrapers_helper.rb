module ScrapersHelper

  def ingred_selector(doc, url)
    selectors = ['span.recipe-ingred_txt', 'span.ingredients-item-name']
    
    # loop do 
      selectors.each do |sel|
        return [doc.css(sel), doc, url] if doc.css(sel).length > 0
      end
    #   if url.url.include?('video')
    #     # debugger
    #     new_url = doc.css('a.btns-one-large').map { |link| link['href'] }.first
    #     # url.update_attribute(:url, new_url)
    #     # url = new_url
    #     doc = Nokogiri::HTML(open(new_url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)) 
    #   else 
    #     return false 
    #   end        
    # end
    false 
  end

  def dir_selector(doc, url)
    selectors = ['span.recipe-directions__list--item', 'div.section-body p']

    selectors.each do |sel|
      return [doc.css(sel), doc, url] if doc.css(sel).length > 0
    end

    debugger
    return false 
  end

  def img_selector(doc, url)
    selectors = ['div.image-container div:first-child', 'img.rec-photo']

    selectors.each_with_index do |sel, i|    
      if doc.css(sel).length > 0 && i == 1
        img_src = doc.css(sel).map { |img| img['src'] }        
        return [img_src, doc, url]
      elsif doc.css(sel).length > 0
        img_src = doc.css(sel).attr('data-src').value
        return [img_src, doc, url]
      end
    end

    debugger
    return false 
  end

  def time_selector(doc, url)
    selectors = ['span.ready-in-time', 'div.recipe-meta-item-body']

    selectors.each_with_index do |sel, i|    
      if doc.css(sel).length > 0 && i == 0
        time_arr = doc.css(sel).text.downcase.split(' ')
        return [time_arr, doc, url]
      # elsif doc.css(sel).length > 0
        # time_arr = doc.css(sel).select { |el| el.text.include?('h') || el.text.include?('m')}.first.text.split(' ').reject { |el| el == ' ' }
        # return [time_arr, doc, url]
      end
    end

    # debugger
    return false 
  end





  def ingred_parse(ingreds)
    nums = '1234567890/'.split('')
    all_words = []

    ingreds.each do |ingred|
      sections = ingred.split(',')
      food = sections[0]
      words = food.split(' ')
      words = words.reject { |word| word.each_char.any? { |ch| nums.include?(ch )} }
      all_words.concat(words)
    end

    all_words
  end
end
