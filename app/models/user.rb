class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
#ユーザー名は2~20文字とする

  has_many :books
  validates :name,    length: { in: 2..20 }
#ユーザー名が空欄の場合はエラーメッセージを表示する
  validates :name, presence: true

#ファイルアップロード用のGemを使用できるようにしている
  attachment :profile_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable

#自己紹介文は最大７５文字
  validates :introduction,length: { maximum: 75 }
end