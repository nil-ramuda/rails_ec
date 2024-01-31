# frozen_string_literal: true

item1 = Item.new(
  name: 'イチゴショートケーキ',
  price: 150,
  detail: 'シャンテリークリームに苺、スポンジをあわせたスタンダードなショートケーキ。大切な記念日におすすめです。'
)
item1.image.attach(io: File.open(Rails.root.join('app/assets/images/items/strawberry-short-cake.jpg')),
                   filename: 'strawberry-short-cake.jpg')
item1.save

item2 = Item.new(
  name: 'チョコレートショートケーキ',
  price: 180,
  detail: 'なめらかなチョコレートクリームとソフトなチョコスポンジ、サンドしたチョコチップをお楽しみください。'
)
item2.image.attach(io: File.open(Rails.root.join('app/assets/images/items/chocolate-short-cake.jpg')),
                   filename: 'chocolate-short-cake.jpg')
item2.save

item3 = Item.new(
  name: 'モンブラン',
  price: 150,
  detail: '蒸し栗ペーストを入れ、栗のおいしさをとじこめました。黄色いマロンクリーム、シャンテリークリーム、スポンジの一体感が楽しめるモンブランです。'
)
item3.image.attach(io: File.open(Rails.root.join('app/assets/images/items/mont-blanc.jpg')), filename: 'mont-blanc.jpg')
item3.save

item4 = Item.new(
  name: '抹茶ロール',
  price: 250,
  detail: '鹿児島県産一番茶抹茶使用。抹茶スポンジに抹茶味のクリームとガナッシュ、大納言かのこをサンドした抹茶好きにはたまらない贅沢な抹茶です。'
)
item4.image.attach(io: File.open(Rails.root.join('app/assets/images/items/green-tea-cake-roll.jpg')),
                   filename: 'green-tea-cake-roll.jpg')
item4.save

item5 = Item.new(
  name: 'チーズケーキ',
  price: 150,
  detail: 'デンマーク産のクリームチーズを使用した、ふんわりとした口どけが特長の濃厚なスフレチーズケーキです。'
)
item5.image.attach(io: File.open(Rails.root.join('app/assets/images/items/cheese-cake.jpg')),
                   filename: 'cheese-cake.jpg')
item5.save

item6 = Item.new(
  name: 'ブルーベリータルト',
  price: 130,
  image_name: 'blueberry-torte.jpg',
  detail: 'リッチなコクのあるタルト台にブルーベリーをたっぷり飾り、ブルーベリーソースで仕上げました。'
)
item6.image.attach(io: File.open(Rails.root.join('app/assets/images/items/blueberry-torte.jpg')),
                   filename: 'blueberry-torte.jpg')
item6.save

item7 = Item.new(
  name: 'ミルフィーユ',
  price: 100,
  detail: 'ミルフィーユ板に、バターとカスタードクリームを合わせた「ムスリーヌクリーム」をサンドし、サクサク食感のフィアンティーヌがアクセント。'
)
item7.image.attach(io: File.open(Rails.root.join('app/assets/images/items/millfeuile.jpg')), filename: 'millfeuile.jpg')
item7.save

item8 = Item.new(
  name: 'イチゴタルト',
  price: 130,
  detail: 'タルト台に苺をふんだんに飾った、苺が主役のタルトです。'
)
item8.image.attach(io: File.open(Rails.root.join('app/assets/images/items/strawberry-torte.jpg')),
                   filename: 'strawberry-torte.jpg')
item8.save
