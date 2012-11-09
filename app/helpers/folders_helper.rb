module FoldersHelper
  def render_folders_as(folders, how, simple = false)
    @folders = folders
    render "folders/"+(simple ? 'simple' : '')+how
  end
end
