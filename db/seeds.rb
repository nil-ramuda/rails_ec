# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Rails.logger.debug '==================== item create ===================='
item1 = Item.new(
  name: 'イチゴショートケーキ',
  price: 150,
  image_name: 'strawberry-short-cake.jpg',
  detail: 'シャンテリークリームに苺、スポンジをあわせたスタンダードなショートケーキ。大切な記念日におすすめです。'
)
item1.save

item2 = Item.new(
  name: 'チョコレートショートケーキ',
  price: 180,
  image_name: 'chocolate-short-cake.jpg',
  detail: 'なめらかなチョコレートクリームとソフトなチョコスポンジ、サンドしたチョコチップをお楽しみください。'
)
item2.save

item3 = Item.new(
  name: 'モンブラン',
  price: 150,
  image_name: 'mont-blanc.jpg',
  detail: '蒸し栗ペーストを入れ、栗のおいしさをとじこめました。黄色いマロンクリーム、シャンテリークリーム、スポンジの一体感が楽しめるモンブランです。'
)
item3.save

item4 = Item.new(
  name: '抹茶ロール',
  price: 250,
  image_name: 'green-tea-cake-roll.jpg',
  detail: '鹿児島県産一番茶抹茶使用。抹茶スポンジに抹茶味のクリームとガナッシュ、大納言かのこをサンドした抹茶好きにはたまらない贅沢な抹茶です。'
)
item4.save

item5 = Item.new(
  name: 'チーズケーキ',
  price: 150,
  image_name: 'cheese-cake.jpg',
  detail: 'デンマーク産のクリームチーズを使用した、ふんわりとした口どけが特長の濃厚なスフレチーズケーキです。'
)
item5.save

item6 = Item.new(
  name: 'ブルーベリータルト',
  price: 130,
  image_name: 'blueberry-torte.jpg',
  detail: 'リッチなコクのあるタルト台にブルーベリーをたっぷり飾り、ブルーベリーソースで仕上げました。'
)
item6.save

item7 = Item.new(
  name: 'ミルフィーユ',
  price: 100,
  image_name: 'millfeuile.jpg',
  detail: 'ミルフィーユ板に、バターとカスタードクリームを合わせた「ムスリーヌクリーム」をサンドし、サクサク食感のフィアンティーヌがアクセント。'
)
item7.save

item8 = Item.new(
  name: 'イチゴタルト',
  price: 130,
  image_name: 'strawberry-torte.jpg',
  detail: 'タルト台に苺をふんだんに飾った、苺が主役のタルトです。'
)
item8.save
