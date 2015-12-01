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
      if row[:thumbnail_file_name]
        thumb = File.open("#{Rails.root}/spec/fixtures/images/#{row[:thumbnail_file_name]}")
      else
        thumb = ''
      end
      if row[:category] == 'Theatre'
        category_id = 1
      elsif row[:category] == 'Museum'
        category_id = 2
      elsif row[:category] == 'Cafe'
        category_id = 3
      elsif row[:category] == 'Bar'
        category_id = 4
      elsif row[:category] == 'Club'
        category_id = 5
      end
    Interest.create!({
      :name => row[:name],
      :address => row[:address],
      :longitude => row[:longitude],
      :latitude => row[:latitude],
      :website => row[:website],
      :category_id => category_id,
      :thumbnail => thumb
    })
  end
  Category.create!(:published => true, :name => "Theatre", thumbnail: File.new("#{Rails.root}/spec/fixtures/images/theatre.png"))
  Category.create!(:published => true, :name => "Museum", thumbnail: File.new("#{Rails.root}/spec/fixtures/images/museum.png"))
  Category.create!(:published => true, :name => "Cafe", thumbnail: File.new("#{Rails.root}/spec/fixtures/images/bar.png"))
  Category.create!(:published => true, :name => "Bar", thumbnail: File.new("#{Rails.root}/spec/fixtures/images/cafe.png"))
  Category.create!(:published => true, :name => "Club", thumbnail: File.new("#{Rails.root}/spec/fixtures/images/club.png"))
