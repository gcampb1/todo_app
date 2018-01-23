FactoryBot.define do
  factory :user do
    first_name { FFaker::Name.first_name}
    last_name {FFaker::Name.last_name}
    email {FFaker::Internet.email}


    factory :user_with_tasks do

    after(:build) do |user|
        [:email, :homework].each do |task|
          user.tasks << FactoryBot.build(task, user: user)
        end
      end
    end
  end

  factory :invalid_user, class: User do
  first_name nil
  last_name nil
  email nil
  end
end
