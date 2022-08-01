class Mood < ApplicationRecord
  belongs_to :user
  validates :vibe, presence: true
  validates :health, presence: true
  validates :fun, presence: true
  validates :productivity, presence: true
  validates :user_id, presence: true
end
