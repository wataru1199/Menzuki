class Public::SearchesController < ApplicationController
  before_action :authenticate_member!

  def search
        @reviews = Review.looks(params[:word]).page(params[:page]).per(4)
        @comment = Comment.new
  end

end
