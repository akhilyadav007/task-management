class UserTask < ApplicationRecord
  belongs_to :user
  STATES = %w[Backlog In-progress Done].freeze
  validates :title, :state, :deadline, presence: true
end
