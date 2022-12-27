class Admin::CategoriesController < ApplicationController

 before_action :authenticate_admin!

  def index
    @category= Category.new
    @categories= Category.all
  end

  def create
    @categories = Category.all
     category = Category.new(category_params)
     category.save
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to action: "index"
    else
      render :edit
      @category= Category.find(params[:id])
    end
  end

  def destroy
       category = Category.find(params[:id])
    if category.destroy
       @categories = Category.all.page(params[:page]).per(4)
       redirect_to action: "index"
    end
  end

  private

  def category_params
   params.require(:category).permit(:category_name)
  end


end
