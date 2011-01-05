# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create!(:name => 'admin', :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')

Rank.create!(:name => 'Very Poor', :value => '1')
Rank.create!(:name => 'Below average', :value => '2')
Rank.create!(:name => 'Average', :value => '3')
Rank.create!(:name => 'Above average', :value => '4')
Rank.create!(:name => 'Above above average', :value => '5')
Rank.create!(:name => 'Incredible', :value => '6')
