FactoryBot.define do
  factory :user do
    name { 'テストユーザー'}
    email { 'test@exsample.com'}
    password { 'password'}
  end
end
