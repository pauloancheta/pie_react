json.array! @menus do |menu|
  json.id menu.id
  json.name menu.name
  json.workflow_state menu.workflow_state
  json.start_time menu.start_time
  json.end_time menu.end_time

  json.dishes do
    json.array! Dish.where(menu_id: menu) do |dish|
      json.id dish.id
      json.name dish.name
      json.description dish.description
      json.price dish.price
      json.state dish.workflow_state
    end
  end
end