# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([
  {name: "user1", email: "user1@user.com"},
  {name: "user2", email: "user2@user.com"}
  ])

tasks = Task.create([
  {name: "tarea 1 user 1", due_date:DateTime.now, user_id: User.first.id},
  {name: "tarea 2 user 1", due_date:DateTime.now, user_id: User.first.id},
  {name: "tarea 1 user last", due_date:DateTime.now, user_id: User.last.id}

])
