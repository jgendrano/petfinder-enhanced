class User < ActiveRecord::Base
  validates_uniqueness_of :username, :email
  validates_presence_of :username, :email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
