json.restaurant_name @restaurant.name
json.menus do
  json.array! @menus do |menu|
    if menu.should_be_available?
      json.id menu.id
      json.menu_name menu.name
      json.workflow_state menu.workflow_state
      json.start_time menu.start_time
      json.end_time menu.end_time
      json.start_date menu.start_date
      json.end_date menu.end_date

      json.dishes do
        json.array! Dish.where(menu_id: menu) do |dish|
          json.id dish.id
          json.dish_name dish.name
          json.description dish.description
          json.price dish.price
        end
      end
    end
  end
end