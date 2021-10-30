FactoryBot.define do 
    factory :post do 
        body { "this is a post!" }
        association :author, factory: :user
    end
end