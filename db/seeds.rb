# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clown_images = [
    'https://scontent.cdninstagram.com/hphotos-xpf1/t51.2885-15/s320x320/e15/10954652_385374634968434_1845708048_n.jpg',
    'http://hellopoetry.s3.amazonaws.com/static/cache/0b/09/0b09b39d17a437070c1210161f2fe57a.jpg',
    'http://static.comicvine.com/uploads/scale_medium/7/74629/1414955-spaulding.jpg',
    'https://s-media-cache-ak0.pinimg.com/736x/23/bb/56/23bb567eaec0548ce1ea5f3534d98476.jpg',
    'https://scontent.cdninstagram.com/hphotos-xat1/t51.2885-15/s320x320/e35/11251860_1634002700190868_981339057_n.jpg',
    'https://pbs.twimg.com/profile_images/619471539356991488/l6LdCCM4_400x400.jpg'
]

clown_images.each do |image|
  Clown.create name: Faker::Name.name, contract: Clown::CONTRACTS[rand(3)], image: image
end

