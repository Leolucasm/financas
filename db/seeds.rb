require 'faker'

10.times do
  Account.create(
    description: Faker::Name.name
  )
end
