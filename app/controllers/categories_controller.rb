# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :check_authorised, only: [:show, :update, :destroy] 
  #ensure that the category they are destroying, showing or updating is theirs

  # GET /categories
  def index
    @categories = @user.categories
    json_response(@categories)
  end
      
  # POST /categories
  def create #NEED TO TEST
    category_create = category_params
    category_create[:user_id] = @user.id #THIS PART
    @category = Category.create!(category_create) #the model will auto convert strings into their respective types
    json_response(@category, :created)
  end

  # PUT /categories/:id
  def update
    @category.update(category_params)
    json_response(@category, :ok)
  end

  # DELETE /categories/:id
  def destroy
    @category.destroy
    head :no_content
  end

  private

  def category_params
    # whitelist params #properties tied directly to params, not within an object
    params.permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def check_authorised #ensure that the category they are destroying, showing or updating is theirs
    json_response({ message: "Unauthorised."}, :unauthorized) if @user.id != @category.user_id
  end
end