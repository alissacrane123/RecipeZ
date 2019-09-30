class Api::RecipesController < ApplicationController

  def index

    if params[:filters]
      search_word = params[:filters][:main].split(' ').first if params[:filters][:main]
      ingreds = params[:filters][:ingreds].split('+').map { |el| "%#{el}%"} if params[:filters][:ingreds]
      query = (["keywords like ?"] * ingreds.length ).join(" AND ") if params[:filters][:ingreds]
    end

    if search_word && ingreds
      # query = (["keywords like ?"] * ingreds.length ).join(" AND ")
      ingreds = Ingredient.includes(:recipe).where(query, *ingreds)
      recipes1 = ingreds.map(&:recipe)
      recipes2 = Recipe.where(["title like ?", "%#{search_word}%"])
      @recipes = recipes1.select { |rec| recipes2.map(&:id).include?(rec.id) }
    elsif search_word
      @recipes = Recipe.where(["title like ?", "%#{search_word}%"])
    elsif ingreds
      # debugger
      # query = (["keywords like ?"] * ingreds.length ).join(" AND ")
      ingreds = Ingredient.includes(:recipe).where(query, *ingreds)
      @recipes = ingreds.map(&:recipe)
    else
      @recipes = Recipe.includes(:ingredient).all.shuffle.take(20)
    end

    # render "api/recipes/recipe"
  end

  def show
    @recipe = Recipe.find(params[:id])
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

