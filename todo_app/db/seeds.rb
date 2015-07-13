# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

HOME_TASKS = ["Walk the dog", "Grocery shopping", "Do laundry"]
WORK_TASKS = ["Write a report", "Give presentation"]
LIST = ["Home task", "Work task"]
USER = [["anna","1234"],["alina","apple"]]

USER.each do |user|
  User.create(username: user[0], password: user[1])
end

LIST.each do |list|
  List.create(name: list, user_id: 1)
end

HOME_TASKS.each do |task|
  Task.create(description: task, list_id: 1)
end

WORK_TASKS.each do |task|
  Task.create(description: task, list_id: 2)
end




