class Public::HomesController < ApplicationController

  #管理者用とゲスト,会員用でレイアウト(ヘッダー等)変更
   layout'public'

  def top
    @categories= Category.all
  end

  def about
  end

end
