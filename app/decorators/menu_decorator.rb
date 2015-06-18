class MenuDecorator < Draper::Decorator
  delegate_all

  def delete
    h.link_to "Delete", h.restaurant_menu_path(object.restaurant_id, object), method: :delete, data: {confirm: "Are you sure?"}, class: "btn btn-default"
  end

  def edit
    h.link_to "Edit", h.edit_restaurant_menu_path(object.restaurant_id, object), class: "btn btn-default"
  end

  def time_available
    if time_start && time_end
      "and will start at: #{time_start} and end at: #{time_end}"
    end
  end

  def state
    "This menu is #{object.workflow_state.capitalize}"
  end
  
  def change_state
    case object.workflow_state.capitalize
    when "Draft"
      h.link_to "Publish", h.menu_publish_path(object), method: :patch, class: 'button'
    when "Published"
      h.link_to "Cancel", h.menu_cancel_path(object), method: :patch, class: 'button'
    end
  end

  def should_be_available?
    if time_start && time_end
      time_now = time_format(Time.now)
      if time_start <= time_now && time_end >= time_now
        object.unpause! unless object.published? || object.draft?
      else
        object.pause! unless object.paused? || object.draft?
      end
    end

    if object.start_date && object.end_date
      if object.start_date <= Time.now() && object.end_date >= Time.now()
        object.publish! unless object.published?
      else
        object.cancel! unless object.draft?
      end
    end
    true
  end


  private
  def time_start
    time_format(object.start_time)
  end

  def time_end
    time_format(object.end_time)
  end

  def time_format(time)
    time.strftime("%H:%M") if time
  end
end