# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create!(
   [    {
      category_name: "ラーメン",
      order_number: 0,
    },
        {
      category_name: "つけ麺",
      order_number: 0,
    },
        {
      category_name: "そば",
      order_number: 0,
    },
        {
      category_name: "うどん",
      order_number: 0,
    },
        {
      category_name: "まぜそば",
      order_number: 0,
    },
        {
      category_name: "パスタ",
      order_number: 0,
    },
        {
      category_name: "その他",
      order_number: 1,
    }   ]
 )

 Member.create!(
   [    {
      email: "p@co.jp",
      password: "666666",
      name: "佐藤健司",
      is_deleted: false,
      introduction: "よろしくお願いします！",
    },
        {
      email: "a@co.jp",
      password: "666666",
      name: "斎藤あゆみ",
      is_deleted: false,
      introduction: "よろしくお願いします！",
    },
        {
      email: "b@co.jp",
      password: "666666",
      name: "高橋一誠",
      is_deleted: false,
      introduction: "よろしくお願いします！",
    }   ]
 )


 Review.create!(
   [    {
      member_id: "1",
      category_id: "1",
      shop_name: "神楽",
      place: "鳥取",
      review_cont: "おいしい！",
    },
        {
      member_id: "1",
      category_id: "3",
      shop_name: "しおや",
      place: "広島",
      review_cont: "絶妙な塩加減！",
    },
        {
      member_id: "2",
      category_id: "5",
      shop_name: "湖沼",
      place: "東京",
      review_cont: "高級感！",
    }   ]
 )


 Admin.create!(
   [    {
      email: "admin@co.jp",
      password: "666666",
    }   ]
 )