var IndexPage = React.createClass({
  getInitialState: function(){
    return {restaurants: this.props.restaurants}
  },
  
  render: function(){
    restuarantArray = []
    this.state.restaurants.forEach(function(restaurant){
      restuarantArray.push(restaurant)
    });
    return(
      {restuarantArray}
    )
  }
});