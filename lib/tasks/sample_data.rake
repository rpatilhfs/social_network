namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    #User.create!(name: "Example User",
    #             email: "example@railstutorial.org",
    #             password: "foobar",
    #             password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email_name = name.gsub(" ","").downcase
      email = "#{email_name}-example@mailinator.com"
      password  = "123456"
      token = "#{n+1}-#{email_name}"
      puts "#{n} :: Name : #{name}"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   remember_token: token  )
      puts "Creation Done for Name : #{name}"
      
    end
  end
end