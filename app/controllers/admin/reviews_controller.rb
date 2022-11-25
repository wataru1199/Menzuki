class Admin::ReviewsController < ApplicationController

   before_action :authenticate_admin!

  def index
     @reviews= Review.all.order(created_at: :desc).page(params[:page]).per(4)
  end

  def destroy
       @review= specific_review
    if @review.destroy
       @reviews= Review.all.order(created_at: :desc).page(params[:page]).per(4)
       redirect_to admin_reviews_path
    end
  end

  def show
     @review= specific_review
  end

  def edit
     @review= specific_review
  end

  def update
     @review= specific_review
    if @review.update(review_params)
      redirect_to admin_review_path(@review.id)
    end
  end


  private

  def review_params
   params.require(:review).permit(:shop_name, :place, :review_cont, :category_id, :image, :member_id)
  end

  def specific_review
    Review.find(params[:id])
  end

end
