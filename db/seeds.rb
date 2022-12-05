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
    }
   ]
)