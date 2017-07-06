# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'
# file = File.read(Rails.root.join('db', 'service.csv'))

# Seed Services
CSV.foreach(Rails.root.join('db', 'service.csv'), headers: true) { |row| Service.create(group: row[0],restrictions: row[1], name: row[2], procedure_code: row[3], effective_date: row[4]) }
