class Bookmarker < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest

  validate :user_id, presence: true
end
