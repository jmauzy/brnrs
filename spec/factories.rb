FactoryGirl.define do
  factory :link do
    url "http://www.google.com/"

    factory :redirect_expired_link do
      redirect_count 1
      max_redirects 1
    end

    factory :time_expired_link do
      expiration Time.new(0)
    end
    
  end
end
