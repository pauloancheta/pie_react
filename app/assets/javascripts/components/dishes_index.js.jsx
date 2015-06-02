var DishesIndex = React.createClass({
  getInitialState: function(){
    return { dishes: this.props.dishes }
  },

  render: function(){
    var dishArray = []
    this.state.dishes.forEach(function(dish){
      dishArray.push(<Dish dishData={dish} />)
    })
    return(
      <div>
        {dishArray}
      </div>
    )
  }
})