class Api::RecipesController < ApplicationController

  def index
    # debugger
    if params[:filters]
      search_word = params[:filters][:main].split(' ').first
      max_ingred = params[:filters][:num_ingred].to_i
    end
    # debugger
    if search_word && max_ingred != 0
      @recipes = Recipe.where(["main = ? AND num_ingred < ?", search_word, max_ingred])
    elsif search_word
      @recipes = Recipe.where(["main = ?", search_word])
    elsif max_ingred != 0
      @recipes = Recipe.where(["num_ingred < ?", max_ingred])
    else
      @recipes = Recipe.all.shuffle.take(20)
    end

    # render "api/recipes/recipe"
  end

  def show

  end

  def create

  end

  def update

  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingreds, :directions, :img_src)
  end
end
