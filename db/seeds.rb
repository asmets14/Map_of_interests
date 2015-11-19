# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

  AdminUser.create!(email: 'admin@users.com', password: 'password', password_confirmation: 'password')

  path = "#{Rails.root}/spec/fixtures/interests_points.csv"
  CSV.foreach(path, { encoding: "UTF-8", headers: true,  header_converters: :symbol, converters: :all}) do |row|
    Interest.create(row.to_hash)
  end
