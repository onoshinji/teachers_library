FactoryBot.define do
  factory :post1, class: Post do

    subject { '国語' }
    unit { 'くじらぐも' }
    grade { '１年生' }
    kind { 'ワークシート' }
    association :user
  end

  factory :post2, class: Post do

    subject { '算数' }
    unit { 'かけ算' }
    grade { '２年生' }
    kind { 'ワークシート' }
    association :user
  end

  factory :post3, class: Post do

    subject { '社会' }
    unit { 'まち探検' }
    grade { '３年生' }
    kind { 'ワークシート' }
    association :user
  end

  factory :post4, class: Post do

    subject { '理科' }
    unit { '自然の力' }
    grade { '４年生' }
    kind { 'ワークシート' }
    association :user
  end

  factory :post5, class: Post do

    subject { '体育' }
    unit { 'ハードル走' }
    grade { '５年生' }
    kind { '指導案' }
    association :user
  end

  factory :post6, class: Post do

    subject { '道徳' }
    unit { '星野くんの2塁打' }
    grade { '６年生' }
    kind { '指導案' }
    association :user
  end

  factory :post7, class: Post do

    subject { '図画工作' }
    unit { '絵具' }
    grade { '特別支援' }
    kind { '指導案' }
    association :user
  end

  factory :post8, class: Post do

    subject { '総合' }
    unit { '影絵' }
    grade { '１年生' }
    kind { 'ワークシート' }
    association :user
  end
  factory :post9, class: Post do

    subject { '特別活動' }
    unit { '学級討論会' }
    grade { '１年生' }
    kind { 'ワークシート' }
    association :user
  end
end
