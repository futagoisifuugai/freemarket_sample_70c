FactoryBot.define do

  factory :product do
    
    id                    {100}
    seller_id             {1}
    name                  {"パン"} 
    description           {"美味しいです"}
    category_id           {212}
    condition_id          {1}
    postage_burden        {1}
    sending_method_id     {1}
    area_id               {1}
    scheduled_sending_date{1}
    price                 {700}
  end

end