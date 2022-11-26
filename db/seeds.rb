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
      name: "サンプル健司",
      is_deleted: false,
      introduction: "よろしくお願いします！",
    },
        {
      email: "a@co.jp",
      password: "666666",
      name: "サンプルあゆみ",
      is_deleted: false,
      introduction: "よろしくお願いします！",
    },
        {
      email: "b@co.jp",
      password: "666666",
      name: "サンプル一誠",
      is_deleted: false,
      introduction: "よろしくお願いします！",
    }   ]
 )



 review = Review.create!(
      member_id: "1",
      category_id: "1",
      shop_name: "サンプル店",
      place: "鳥取",
      review_cont: "おいしい！",
      )
review.image.attach(io: File.open(Rails.root.join('app/assets/images/24761383_s.jpg')), filename: '24761383_s.jpg')

 review = Review.create!(
      member_id: "2",
      category_id: "1",
      shop_name: "サンプル店",
      place: "鳥取",
      review_cont: "おいしい！",
      )
review.image.attach(io: File.open(Rails.root.join('app/assets/images/24908603_m.jpg')), filename: '24908603_m.jpg')

 review = Review.create!(
      member_id: "3",
      category_id: "1",
      shop_name: "サンプル店",
      place: "東京",
      review_cont: "おいしい！",
      )
review.image.attach(io: File.open(Rails.root.join('app/assets/images/25006140_s.jpg')), filename: '25006140_s.jpg')


 Admin.create!(
      email: ENV['SECRET_EMAIL'],
      password: ENV['SECRET_PASSWORD'],
    }   ]
 )