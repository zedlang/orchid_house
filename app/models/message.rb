class Message < ApplicationRecord
  validates :name, :email, presence: :true
end
