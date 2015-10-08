# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user_admin = User.where(:email => "admin.info@gmail.com").try(:first)
unless user_admin.present?
  user = User.new(:email => "admin.info@gmail.com", :password => "admin!@#", :first_name => "XXX", :last_name => "YYY", :confirmation_token => nil,:confirmed_at => Time.now,:role_id => 1,:role_name => "Admin")
  user.save!(:validate => false)
end
