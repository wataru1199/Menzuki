class Admin::ReviewsController < ApplicationController

   before_action :authenticate_admin!

  def index
     @reviews= Review.all.order(created_at: :desc).page(params[:page]).per(4)
  end

  def destroy
       @review= Review.find(params[:id])
    if @review.destroy
       @reviews= Review.all.order(created_at: :desc).page(params[:page]).per(4)
       redirect_to admin_reviews_path
    end
  end

  def show
     @review= Review.find(params[:id])
  end

  def edit
     @review= Review.find(params[:id])
  end

  def update
     @review= Review.find(params[:id])
    if @review.update(review_params)
      redirect_to admin_review_path(@review.id)
    end
  end
  
  def destroy_select
    
  end


  private

  def review_params
   params.require(:review).permit(:shop_name, :place, :review_cont, :category_id, :image, :member_id)
  end


end
