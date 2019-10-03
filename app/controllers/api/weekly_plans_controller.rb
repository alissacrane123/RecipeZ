class Api::WeeklyPlansController < ApplicationController

  def create 
    @weekly_plan = WeeklyPlan.new(weekly_plan_params)

    if @weekly_plan.save
      render "api/weekly_plans/show"
    else
      render json: @weekly_plan.errors.full_messages, status: 422
    end
  end

  def index 
    @weekly_plans = current_user.weekly_plans.includes(meals: :recipe)
    render "api/weekly_plans/index"
  end

  def current_show 
    start_date = monday_date
    all_plans = current_user.weekly_plans.includes(meals: :recipe)
    @weekly_plan = current_user.weekly_plans
      .includes(meals: :recipe)
      .where(start_date: start_date)
    
    render "api/weekly_plans/current"
    
  end


  private 

  def weekly_plan_params 
    params.require(:weekly_plan).permit(:weekly_plan_id, :date, :recipe_id, :grocery_list)
  end
end
