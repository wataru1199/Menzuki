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
    },
        {
      category_name: "つけ麺",
    }, 
        {
      category_name: "そば",
    }, 
        {
      category_name: "うどん",
    }, 
        {
      category_name: "まぜそば",
    }, 
        {
      category_name: "パスタ",
    },
        {
      category_name: "その他",
    }   ] 
 )

