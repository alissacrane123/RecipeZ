class Api::RecipesController < ApplicationController

  def index
    # debugger
    search_word = params[:filters][:main].split(' ').first
    max_ingred = params[:filters][:num_ingred].to_i
    debugger
    @recipes = Recipe.where(["main = ? AND num_ingred < ?", search_word, max_ingred])
    # debugger

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
