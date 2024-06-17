class UserTaskMailer < ApplicationMailer
  default from: 'no-reply@taskapp.com'

  def deadline_alert(user, task, time_frame)
    @user = user
    @task = task
    @time_frame = time_frame
    mail(to: @user.email, subject: "Task Deadline Alert: #{@task.title}")
  end
end
