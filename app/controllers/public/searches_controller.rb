class Public::SearchesController < ApplicationController
  before_action :authenticate_member!

  def search
     @comment = Comment.new
     @reviews = Review.looks(search_params).page(params[:page]).per(4)
  end


 private

  def search_params
   params.require(:word)
  end

end
