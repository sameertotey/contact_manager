# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 users = User.create([
  { provider: 'twitter', uid: 'uid1', name: 'Sameer'},
  { provider: 'twitter', uid: 'uid2', name: 'Shital'},
  { provider: 'twitter', uid: 'uid3', name: 'Saras'}
  ])
