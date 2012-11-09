module TaskContextsHelper

  def render_contexts_as(task_contexts, how, simple = false)
    @task_contexts = task_contexts
    render "task_contexts/"+(simple ? 'simple' : '')+how
  end
end
