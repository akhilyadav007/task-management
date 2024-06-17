namespace :tasks do
  desc "Send reminder emails for tasks nearing deadline"
  task send_reminder_emails: :environment do
    tasks_to_remind = Task.where('deadline <= ?', Time.zone.now + 1.day)
                          .where(state: ['Backlog', 'In-progress'])

    tasks_to_remind.each do |task|
      TaskReminderMailer.remind_task_due(task).deliver_now
    end

    tasks_to_remind_hour = Task.where('deadline <= ?', Time.zone.now + 1.hour)
                                .where(state: ['Backlog', 'In-progress'])

    tasks_to_remind_hour.each do |task|
      TaskReminderMailer.remind_task_due(task).deliver_now
    end
  end
end
