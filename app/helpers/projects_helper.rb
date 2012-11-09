module ProjectsHelper

  def render_projects_as(projects, how, simple = false)
    @projects = projects
    render "projects/"+(simple ? 'simple' : '')+how
  end

end
