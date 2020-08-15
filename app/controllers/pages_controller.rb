class PagesController < ApplicationController
  before_action :authenticate_user!

  def my_recipes
  end
end
