module TasksHelper
  def render_tasks_as(tasks, how, simple = false)
    @tasks = tasks
    render "tasks/"+(simple ? 'simple' : '')+how
  end
end
