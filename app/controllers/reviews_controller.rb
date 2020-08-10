class ReviewsController < ApplicationController
  before_action :find_recipe
  before_action :authenticate_user!

def new
  @user = current_user
  @review = Review.new
end

def create
  @review = Review.new(review_params)
  @review.user_id = current_user.id
  @review.recipe_id = @recipe.id
  if @review.save
    redirect_to @recipe
  else
    flash[:alert] = "Something went wrong."
    render :new
  end
end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
