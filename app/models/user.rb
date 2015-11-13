class User < ActiveRecord::Base
  has_many :bookmarkers
  has_many :interests, through: :bookmarkers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
