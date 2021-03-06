class TempUser < ApplicationRecord
  has_one :cart, as: :overall_user
  has_many :orders, as: :overall_user
  has_one :user_address, as: :overall_user
  has_many :tickets
end
