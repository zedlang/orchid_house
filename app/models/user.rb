class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :addresses, :dependent => :destroy
  accepts_nested_attributes_for :addresses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :first_name, :last_name, {:with => /\A[a-z]+\Z/i,
    message: "This field can only contain the letters A-Z or a-z"}

end
