FactoryBot.define do

  factory :user_adress do

    first_name            {"金子"}
    last_name             {"真也"}
    first_name_kana       {"カネコ"}
    last_name_kana        {"シンヤ"}
    postal_code           {"1111111"}
    prefectures           {"熊本県"}
    city                  {"堅粕4"}
    city_adress           {"11-1"}
    building              {""}
    phone_number          {"11111111111"}
    user_id               {"1"}
  end

end