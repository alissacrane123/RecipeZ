class NutritionScrapersController < ApplicationController
  def import 
    File.open("#{Rails.root}/public/nutrition.txt").each do |line|
      # debugger

      quantity = 100
      array = line.split('~')
      nbd_no = array[1].to_i
      names = array[3].split(',')
      name = names.shift.downcase
      # debugger

      kind = names.length > 0 ? names.shift.downcase : ''

      desc = names.length > 0 ? names.map { |el| el.downcase }.join(' ') : ''
      
      nutrition = array[4].split('^')
      water = nutrition[1].to_i
      cals = nutrition[2].to_i
      protein = nutrition[3].to_i
      fat = nutrition[4].to_i
      carbs = nutrition[6].to_i
      fiber = nutrition[7].to_i
      sugar = nutrition[8].to_i
      calcium = nutrition[9].to_i

      nut = Nutrition.new(
        name: name, 
        kind: kind,
        description: desc,
        nbd_no: nbd_no,
        grams: 100,
        cals: cals, 
        protein: protein, 
        fat: fat, 
        carbs: carbs,
        fiber: fiber,
        sugar: sugar,
        calcium: calcium)

      # debugger 

      if nut.save
        next 
      else
        debugger
      end
      # name = 

    end
  end
end
