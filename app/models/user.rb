class User < ApplicationRecord
  has_many :carts
  has_many :products, through: :carts



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         enum role: {buyer:0, admin:1}
end
