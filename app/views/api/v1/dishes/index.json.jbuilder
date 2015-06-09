json.array! @dishes do |dish|
  json.id dish.id
  json.name dish.name
  json.description dish.description
  json.price dish.price
  json.workflow_state dish.workflow_state
end