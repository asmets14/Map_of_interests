class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :point_of_interest

  validate :user_id, presence: true
end
