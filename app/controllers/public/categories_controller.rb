class Public::CategoriesController < ApplicationController
  before_action :authenticate_member!

  def index
    @category = Category.find(params[:id])
    @comment = Comment.new
  end

end
