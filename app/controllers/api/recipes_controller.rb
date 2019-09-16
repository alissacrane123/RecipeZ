class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all

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
