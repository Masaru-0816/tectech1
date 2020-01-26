class Kid < ApplicationRecord
  has_many :kid_users
  has_many :users, through: :kid_users
  validates :name, presence: true
end
