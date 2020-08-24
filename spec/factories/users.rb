FactoryBot.define do
  factory :user1 ,class: User do
    id { 10000 }
    name { 'user1' }
    email { 'user1@example.com' }
    password { '00000000' }
    admin { false }
    confirmed_at { Date.today }
  end
  factory :user2 ,class: User do
    id { 10001 }
    name { 'user2' }
    email { 'user2@example.com' }
    password { '00000000' }
    admin { false }
    confirmed_at { Date.today }
  end
  factory :admin_user1, class: User do
    id { 10002 }
    name { 'admin1' }
    email { 'admin1@example.com' }
    password { '00000000' }
    admin { true }
    confirmed_at { Date.today }
  end
  factory :admin_user2, class: User do
    id { 10003 }
    name { 'admin2' }
    email { 'admin2@example.com' }
    password { '00000000' }
    admin { true }
    confirmed_at { Date.today }
  end
end
