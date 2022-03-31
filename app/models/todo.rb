class Todo < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  acts_as_list scope: :user
end
