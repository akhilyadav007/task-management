class DeadlineAlertJob < ApplicationJob
  queue_as :default

  def perform(task_id, time_frame)
    task = UserTask.find(task_id)
    user = task.user
    UserTaskMailer.deadline_alert(user, task, time_frame).deliver_now
  end
end
