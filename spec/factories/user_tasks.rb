FactoryBot.define do
  factory :user_task do
    association :user
    title { "Test Task" }
    description { "Test Description" }
    state { "Backlog" }
    deadline { 1.day.from_now }
  end
end
