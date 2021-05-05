FactoryBot.define do
  factory :article do
    title { "MyString" }
    description { "MyText" }
  end

  factory :user do
    username { "Joe" }
    user_email { "joe@example.com" }
  end

  factory :category do
    title { "Bulking" }
  end

  factory :entry do
    meal_type {  }
    carbohydrates { 100 }
    proteins { rand(80) }
    fats { 20 }
    calories {  }

    user
    category
  end
end
