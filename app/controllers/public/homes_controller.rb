class Public::HomesController < ApplicationController

  def top
    @categories= Category.all.order("order_number")
    @reviews = Review.order( created_at: :DESC)
  end

  def about
  end

end
