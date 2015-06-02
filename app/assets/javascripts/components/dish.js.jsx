var Dish = React.createClass({
  getInitialState: function(){
    return {dish: this.props.dishData}
  },
  render: function(){
    return(
      <div className="dish-card">
        <h1>{this.state.dish.name}</h1>
        <p>{this.state.dish.description}</p>
        <p>{this.state.dish.price}</p>
      </div>
    )
  }
})