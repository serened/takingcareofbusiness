FactoryGirl.define do

  factory :user do
    email Faker::Internet.email(Faker::Name.first_name)
    password Faker::Internet.password
  end

  factory :project do
    id Faker::Number.number(10)
    title 'Stuff to do'
    note 'I should do this by May'
  end

  factory :task do
    id Faker::Number.number(5)
    title 'Do boring thing'
    note 'I hate boring things'
    completed false
    project
  end
end
