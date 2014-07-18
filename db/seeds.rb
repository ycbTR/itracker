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


Admin.create do |c|
  c.firstname = "Admin"
  c.middlename = "M"
  c.lastname = "Lastname"
  c.email = "admin@admin.com"
  c.password = "123123123"
  c.password_confirmation = "123123123"
  c.license_num= "D-33029394"
  c.title_id = Title.last.id
end

Employee.create do |c|
  c.firstname = "Assistant"
  c.middlename = "M"
  c.lastname = "Lastname"
  c.email = "employee@admin.com"
  c.password = "123123123"
  c.password_confirmation = "123123123"
  c.license_num= "Em-33029394"
  c.title_id = Title.first.id
end