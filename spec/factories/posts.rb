FactoryGirl.define do
  factory :post do
    caption "#cheeses"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/charlie_cheese.jpeg', 'image/jpg')
  end
end
