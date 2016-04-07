class User < ActiveRecord::Base
  validates_uniqueness_of :username, :email, :phone_number
  validates_presence_of :username, :email, :phone_number

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
