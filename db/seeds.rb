# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Division.create ([{:name=>"Division 1"},{:name=>"Division 2"},{:name=>"Division 3"},{:name=>"Division 4"}])
Roles.create ([{:name=>"DivisionOneManager"},{:name=>"DivisionTwoManager"},{:name=>"DivisionThreeManager"},{:name=>"DivisionFourManager"}]

