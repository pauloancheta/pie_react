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
    when "Unavailable"
      h.link_to "Unpause", h.menu_unpause_path(object), method: :patch, class: 'button'
    end
  end

  def should_be_available?
    time_now = time_format(Time.now)
    if time_start && time_end
      if time_start <= time_now && time_end >= time_now
        object.unpause! unless object.available?
      else
        object.pause! unless object.paused?
      end
    end
    true
  end

  def time_available
    if time_start && time_end
      "Menu start: #{time_start} Menu end: #{time_end}"
    end
  end

  private
  def time_start
    time_format(object.start_time)
  end

  def time_end
    time_format(object.end_time)
  end

  def time_format(time)
    if time
      time.strftime("%H:%M")
    end
  end
end