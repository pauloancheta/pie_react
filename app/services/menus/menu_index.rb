# class MenuIndex::Menu
#   include Virtus.model
#   #input
#   attribute :user, User
#   attribute :restaurant, Restaurant

#   #output
#   attribute :menu, Menu

#   def call
#     if user.is_admin
#       @menus = @restaurant.menus.all.decorate
#     else
#       @menus = @restaurant.menus.with_available_state.decorate
#     end
#   end
#   private

# end