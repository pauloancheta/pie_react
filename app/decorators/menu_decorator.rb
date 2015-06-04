class MenuDecorator < Draper::Decorator
  delegate_all

  def state
    object.workflow_state.capitalize
  end

  def change_state
    case object.workflow_state.capitalize
    when "Draft"
      h.link_to "Publish", h.menu_publish_path(object), method: :patch, class: 'button'
    when "Available"
      h.link_to "Pause", h.menu_pause_path(object), method: :patch, class: 'button'
    when "Paused"
      h.link_to "Unpause", h.menu_unpause_path(object), method: :patch, class: 'button'
    end
  end
end