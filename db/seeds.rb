# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


["Mr", "Mrs"].each do |name|
  Salutation.create(name: name)
end

["Dr.", "Prof."].each do |name|
  Title.create(name: name)
end

["Stroke", "Diabets", "Heart Disease"].each do |name|
  MedicalCondition.create(name: name)
end

["Need new glasses", "Want contact lenses", "Headaches"].each do |name|
  Reason.create(name: name)
end