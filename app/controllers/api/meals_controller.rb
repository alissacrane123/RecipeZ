class Api::MealsController < ApplicationController

  def create 
    @meal = Meal.new(meal_params)

    if @meal.save
      render "api/meals/index"
    else
      render json: @meal.errors.full_messages, status: 422
    end
  end

  def index 
    @meals = current_user.meals.includes(:recipe)
    render "api/meals/index"
  end

  private 

  def meal_params 
    params.require(:meal).permit(:weekly_plan_id, :date, :recipe_id, :grocery_list)
  end
end
