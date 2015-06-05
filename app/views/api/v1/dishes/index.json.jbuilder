json.array! @dishes do |dish|
  json.id dish.id
  json.name dish.name
  json.description dish.description
  json.price dish.price
  json.workflow_state dish.workflow_state
  json.primary_diet dish.primary_diet
  json.optional_diet dish.optional_diet
end