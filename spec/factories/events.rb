FactoryBot.define do
  factory :event do
    date { '2020-01-24 16:18:56' }
    title { 'Raggaeton' }
    location { 'Brazil' }
    description { 'This is another Party' }
    creator_id { 1 }
  end
end
