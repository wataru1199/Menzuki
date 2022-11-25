class Public::FavoritesController < ApplicationController

 before_action :authenticate_member!

def create  #いいねする
 @review = Review.find(params[:review_id])
#いいねをする対象の投稿idを取得
 favorite = current_member.favorites.new(review_id: @review.id)
#現在のmemberに紐づくfavoriteテーブルのレコードを作成
#作成するレコードのreview_idカラムは上記で取得したいいねの対象となる投稿id
 favorite.save
#レコード保存
 # redirect_back fallback_location: root_path
end

def destroy #いいねを取り消す
 @review = Review.find(params[:review_id])
#いいねを取り消す対象の投稿idを取得
 favorite = current_member.favorites.find_by(review_id: @review.id)
#現在のmemberに紐づくfavoriteテーブル(review_idカラムが上記で取得したいいね取り消しの対象となる投稿idのもの)
 favorite.destroy
#レコード削除
 # redirect_back fallback_location: root_path
end



end
