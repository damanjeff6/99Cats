# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  Cat.create!(name: "Garfield", age: 1, birth_date: 1.years.ago,
              color: 'YELLOW', sex: 'M')
  Cat.create!(name: "Sprinkles", age: 5, birth_date: 3.years.ago,
              color: 'GREY', sex: 'F')
  Cat.create!(name: "Cheshire", age: 100, birth_date: 50.years.ago,
              color: 'BLACK', sex: 'M')


  # :age,
  # :birth_date,
  # :color,
  # :name,
  # :sex















end