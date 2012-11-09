module TagsHelper

  def render_tags_as(tags, how, simple = false)
    @tags = tags
    render "tags/"+(simple ? 'simple' : '')+how
  end
end
