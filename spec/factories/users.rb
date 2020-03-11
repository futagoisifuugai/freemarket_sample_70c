FactoryBot.define do

  factory :user do
    nickname              {"かねこ"}
    email                 {"kkk@gmail.com"}
    password              {"aaaa0000"}
    password_confirmation {"aaaa0000"}
    first_name            {"金子"}
    last_name             {"真也"}
    first_name_kana       {"カネコ"}
    last_name_kana        {"シンヤ"}
    birthday              {"1990-01-01"}
  end

end