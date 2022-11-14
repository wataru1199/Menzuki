class Public::HomesController < ApplicationController

  def top
    @categories= Category.all.order("order_number")
  end

  def about
  end

end
