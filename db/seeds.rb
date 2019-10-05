# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(login_id: 'deltama')
  User.create(name: 'delta', login_id: 'deltama', password: '123456')
end

ActiveRecord::Base.connection.execute("delete from posts;")
Post.create(user_id: 1, message: 'こんにちは', content: 'こんにちは')
Post.create(user_id: 1, message: 'おはよう', content: 'おはよう')
Post.create(user_id: 1, message: 'こんばんは', content: 'こんばんは')
Post.create(user_id: 1, message: 'おやすみ', content: 'おやすみ')

ActiveRecord::Base.connection.execute("delete from ngwords;")
Ngword.create(name: "死ね")
Ngword.create(name: "しね")
Ngword.create(name: "死ぬ")
Ngword.create(name: "しぬ")
Ngword.create(name: "嫌う")
Ngword.create(name: "きらう")
