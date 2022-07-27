class PostComment < ApplicationRecord
    belongs_to :user
    belongs_to :task
    validates :comment, presence: true
end
