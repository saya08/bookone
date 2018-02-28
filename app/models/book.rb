class Book < ApplicationRecord
	belongs_to :user
#本の感想の本分は最大２００文字
  validates :body,length: { maximum: 200 }
  validates :title,presence: true
end
