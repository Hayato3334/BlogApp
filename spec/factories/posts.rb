FactoryBot.define do
  factory :post do
    title { 'テスト'}
    body { 'RSpec & Capybara & FactoryBotを準備する'}
    user
  end
end
