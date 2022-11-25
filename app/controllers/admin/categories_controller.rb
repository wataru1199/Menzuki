class Admin::CategoriesController < ApplicationController

 before_action :authenticate_admin!

  def index
    @category= Category.new
    @categories= Category.all
  end

  def create
    @categories= Category.all
    @category= Category.new(category_params)
     @category.save
    #   redirect_to action: "index"
    # else
    #   render action: "index"
    # end
  end

  def edit
    @category= specific_category
  end

  def update
    @category= specific_category
    if @category.update(category_params)
      redirect_to action: "index"
    else
      render :edit
      @category= specific_category
    end
  end

  def destroy
       @category= specific_category
    if @category.destroy
       @categories= Category.all.page(params[:page]).per(4)
       redirect_to action: "index"
    end
  end

  private

  def category_params
   params.require(:category).permit(:category_name)
  end

  def specific_category
    Category.find(params[:id])
  end

end
