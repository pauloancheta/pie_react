class DishDecorator < Draper::Decorator
  delegate_all

  def state
    object.workflow_state.capitalize
  end

  def change_state
    case object.workflow_state.capitalize
    when "Draft"
      h.link_to "Publish", h.dish_publish_path(object), method: :patch, remote: true
    when "Available"
      h.link_to "Pause", h.dish_pause_path(object), method: :patch, remote: true
    when "Paused"
      h.link_to "Unpause", h.dish_unpause_path(object), method: :patch, remote: true
    end
  end
end