FactoryBot.define do
  factory :post1, class: Post do
    title { 'title1' }
    content { 'Factory1' }
    time_limit { Date.tomorrow }
    priority { '低' }
    status { '未着手' }
    #モデルにアソシエ〜ションしていることを明示する
    association :user
  end
end
