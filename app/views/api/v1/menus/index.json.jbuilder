json.array! @menus do |menu|
  json.id menu.id
  json.name menu.name
  json.workflow_state menu.workflow_state
  json.start_time menu.start_time if menu.start_time
  json.end_time menu.end_time if menu.end_time
end