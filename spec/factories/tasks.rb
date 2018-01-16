FactoryBot.define do
  factory :homework, class: Task do
    association :user
    name 'Complete homework'
    priority 1
    due_date { DateTime.now + 2.days }
  end

  factory :email, class: Task do
    association :user
    name 'Reply to Uncle Chewies email'
    priority 2
    due_date { DateTime.now }
  end

  factory :invalid_task, class: Task do
    association nil
    name nil
    priority nil
    due_date nil
  end
end
