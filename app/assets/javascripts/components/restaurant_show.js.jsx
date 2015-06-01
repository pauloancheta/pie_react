var RestaurantShow = React.createClass({
  getInitialState: function(){
    return {restaurant: this.props.restaurant}
  },

  render: function(){
    return(
      <div>
        <h1>{this.state.restaurant.name}</h1>
      </div>
    )
  }
})