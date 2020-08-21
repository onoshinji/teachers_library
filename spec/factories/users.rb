FactoryBot.define do
  factory :user1 ,class: User do
    id { 10000 }
    name { 'user1' }
    email { 'user1@example.com' }
    password { '00000000' }
    admin { false }
  end
  factory :user2 ,class: User do
    id { 10001 }
    name { 'user2' }
    email { 'user2@example.com' }
    password { '00000000' }
    admin { false }
  end
  factory :admin_user1, class: User do
    id { 10002 }
    name { 'admin' }
    email { 'admin@example.com' }
    password { '00000000' }
    admin { true }
  end
  factory :admin_user2, class: User do
    id { 10003 }
    name { 'admin2' }
    email { 'admin2@example.com' }
    password { '00000000' }
    admin { true }
  end

  # モデルテスト用ユーザー
  factory :name_null_user, class: User do
    id { 10004 }
    name { '' }
    email { 'user3@example.com' }
    password { '00000000' }
    admin { false }
  end
end
