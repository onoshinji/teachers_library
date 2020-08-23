FactoryBot.define do
  factory :tag1 do
    name { '初任者' }
    #モデルにアソシエ〜ションしていることを明示する
    association :post
  end

  factory :tag2 ,class: Tag do
    name { '2~5年' }
    association :post
  end

  factory :tag3 ,class: Tag do
    name { '10年以上' }
    association :post
  end

  factory :tag4 ,class: Tag do
    name { '20年以上' }
    association :post
  end
end
