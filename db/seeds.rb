# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "seedの実行を開始"

user1 = User.find_or_create_by!(email: "user1@example.com") do |user|
  user.name = "伊藤"
  user.status = "映画好きです"
  user.password = "password"
end

user2 = User.find_or_create_by!(email: "user2@example.com") do |user|
  user.name = "佐藤"
  user.status = "アクション映画が好きです"
  user.password = "password"
end

user3 = User.find_or_create_by!(email: "user3@example.com") do |user|
  user.name = "田中"
  user.status = "映画をよく見ます"
  user.password = "password"
end

Post.find_or_create_by!(user: user1,title: "Spider-Man") do |post|
  post.body = "アクションがとても面白い映画でした。"
  post.rating = 5
end

Post.find_or_create_by!(user: user2,title: "Avengers") do |post|
  post.body = "迫力があって最後まで楽しめました。"
  post.rating = 4
end

Post.find_or_create_by!(user: user3,title: "Your Name") do |post|
  post.body = "ストーリーと映像がきれいで印象に残りました。"
  post.rating = 5
end

puts "seedの実行が完了しました"