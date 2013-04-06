# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin
puts 'DEFAULT MOVIES'
m = Movie.create :title => "Click", :rating => 6.4, :views => 0, :trailer_url => "www.youtube.com/watch?v=PEJUn0KknFQ", :description => "A workaholic architect finds a universal remote that allows him to fast-forward and rewind to different parts of his life. Complications arise when the remote starts to overrule his choices.", :threeD => false, :release_date => "2006-06-26", :genres => ["Comedy", "Drama", "Fantasy"], :running_time => "01:46:00", :directed_by => "Frank Coraci", :starring => ["Adam Sandler", "Kate Beckinsale", "Christopher Walken"], :imdb_code => "tt0389860"
puts 'movie: ' << m.title
puts 'DEFAULT AGERESTRICTIONS'
a = Agerestriction.create :name => "PG-13"
m.agerestriction_id = a.id
m.save
puts '---COMPLETE---'