FactoryGirl.define do
  factory :link do
    target_url "http://www.google.com/"
    after(:build) { |user| user.send(:generate_url_string) } 
    after(:build) { |user| user.send(:set_default_expiration) } 

    factory :redirect_expired_link do
      redirects 1
      max_redirects 1
    end

    factory :time_expired_link do
      expiration 1.day.ago.to_f
    end
    
  end
end
