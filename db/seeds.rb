# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'test@test.com',
    password: '123456',
)

# ジャンルseed
Genre.create!(
  [
    {
      name: 'ビール'
    },
    {
      name: 'ウイスキー'
    },
    {
      name: 'ブランデー'
    },
    {
      name: '焼酎'
    },
    {
      name: 'サワー'
    },
    {
      name: 'ワイン'
    },
    {
      name: '日本酒'
    },
    {
      name: 'その他'
    }
  ]
)

#Customer
Customer.create!(
  [
    {
        name: 'ラーメン好き太郎',
        introduction: '初めまして、ラーメン好きの人です。',
        email: 'i@i',
        password: 'iiiiii'
    },
    {
        name: 'ウイスキー毎日飲酒',
        introduction: '常飲酒はホワイトホースくんです。',
        email: 'a@a',
        password: 'aaaaaa'
    }
   ]
)

Tag.create!(
  [
    {
      name: "蒸留酒"
    }
  ]
)

# sake =
Sake.create!(
      customer_id: 1,
      genre_id: 2,
      name: "black label",
      price: 2100,
      tag_id: 1,
      introduction: "値段の割の味わいとしてはとてもお勧めです。",
      evaluation: 0
)
sake.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

Comment.create|(
  [
    {
      customer_id: 1,
      sake_id: 1,
      comment: "とても美味しいお酒ですね！"
    }
  ]
)