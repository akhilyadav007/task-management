class UserTask < ApplicationRecord
  belongs_to :user
  STATES = %w[In-progress Backlog Done].freeze
  validates :title, :state, :deadline, presence: true
  validates :state, inclusion: { in: STATES }
  scope :not_done, -> { where.not(state: 'Done') }
  after_save :user_task_state

  private

  def user_task_state
    return if state == 'Done'
    
    DeadlineAlertJob.set(wait_until: deadline - 1.day).perform_later(id, '1 day')
    DeadlineAlertJob.set(wait_until: deadline - 1.hour).perform_later(id, '1 hour')
  end
end
