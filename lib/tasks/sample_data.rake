namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Bucketter.create!(
    name: "Example bucketter",
    email: "bucketter@example.jp",
    password: "foobar",
    password_confirmation: "foobar",
    admin: true,
    address: "埼玉県さいたま市大宮　3-2-3-4",
    first_name: "太郎",
    last_name: "田中"
    )

    50.times do |n|
      name = Faker::Japanese::Name.name
      email = "example-#{n+1}@example.jp"
      password = "password"
      address = Faker::Address.country
      first_name = Faker::Japanese::Name.first_name
      last_name = Faker::Japanese::Name.last_name

      Bucketter.create!(
      name: name,
      email: email,
      password: password,
      password_confirmation: password,
      address: address,
      first_name: first_name,
      last_name: last_name
      )
    end

    bucketters = Bucketter.all

    bucketters.each do |bucketter|
        3.times do |n|
          title = Faker::Japanese::Name.name
          version = (rand(10)+1).to_s
          publisher = Faker::Japanese::Name.name
          auther = Faker::Japanese::Name.name

          bucketter.books.create!(
          title: title,
          version: version,
          publisher: publisher,
          auther: auther
          )
      end
    end
  end
end
