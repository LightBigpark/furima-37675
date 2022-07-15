FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'00000a'}
    password_confirmation {'00000a'}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_kana             {"ヤマダ"}
    first_kana            {"タロウ"}
    birthday              {"2000-01-01"}
  end
end
