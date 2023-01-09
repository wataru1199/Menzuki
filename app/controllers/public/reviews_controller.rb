class Public::ReviewsController < ApplicationController

before_action :authenticate_member!

  def new
    @categories = Category.all.order("order_number")
    @review= Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.score = Language.get_data(review_params[:review_cont])
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end

  end

  def index
    @reviews = Review.all.order(created_at: :desc).page(params[:page]).per(4)
    @comment = Comment.new
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    review = Review.find(params[:id])
    if review.destroy
      redirect_to reviews_path
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
       score = Language.get_data(review_params[:review_cont])
       @review.update(score: score)
      redirect_to review_path(@review.id)
    end
  end

  private

  def review_params
   params.require(:review).permit(:shop_name, :place, :review_cont, :category_id, :image, :member_id)
  end

end
