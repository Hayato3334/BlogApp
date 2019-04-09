FactoryBot.define do
  factory :user do
    name { 'テストユーザー'}
    email { 'test1@exsample.com'}
    password { 'password'}
  end
end
