class UserTaskService
  def initialize(user, params)
    @user = user
    @params = params
  end

  def create
    task = @user.user_tasks.build(@params)
    if task.save
      [true, task]
    else
      [false, task]
    end
  end

  def update(task)
    if task.update(@params)
      [true, task]
    else
      [false, task]
    end
  end

  def destroy(task)
    task.destroy
    true
  end
end
