FactoryGirl.define do
  factory :link do
    target_url "http://www.google.com/"

    factory :redirect_expired_link do
      redirects 1
      max_redirects 1
    end

    factory :time_expired_link do
      expiration Time.new(0)
    end
    
  end
end
