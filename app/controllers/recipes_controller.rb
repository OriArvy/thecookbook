class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @recipes = Recipe.all
  end

  def show
    @reviews = Review.where(recipe_id: @recipe.id)
    @user = current_user
  end

  def new
    @recipe = Recipe.new
    @user = current_user
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @user = current_user
    @recipe.user = @user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe.instructions.destroy_all
    @recipe.ingredients.destroy_all
    @recipe.delete
    redirect_to recipes_path
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :photo, ingredients_attributes: [:id, :name, :_destroy], instructions_attributes: [:id, :step, :_destroy])
  end
end
