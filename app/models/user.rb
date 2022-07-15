class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       has_many :items

       validates :nickname,           presence: true
 
       with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'に全角文字を使用してください' } do
        validates :last_name
        validates :first_name
        end
       with_options presence: true, format: { with: /[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/, message: '全角カタカナを使用してください' }do
        validates :last_kana
        validates :first_kana
       end
 
        validates :birthday,           presence: true
 
        validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英数字をそれぞれ含めてください" }
end
