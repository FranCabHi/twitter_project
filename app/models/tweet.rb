class Tweet < ApplicationRecord
  belongs_to :user
  validates :tw_content, presence: true

end
