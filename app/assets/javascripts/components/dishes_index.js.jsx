var DishesIndex = React.createClass({
  getInitialState: function(){
    return { dishes: this.props.dishes }
  },

  render: function(){
    var dishArray = []
    var self = this
    this.state.dishes.forEach(function(dish){
      dishArray.push(<Dish dishData={dish} admin={self.props.admin} />)
    })
    return(
      <div>
        {dishArray}
      </div>
    )
  }
})