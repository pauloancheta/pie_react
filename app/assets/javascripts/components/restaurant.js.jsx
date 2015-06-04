var Restaurant = React.createClass({
  getInitialState: function(){
    return {
      name: this.props.resData.name, 
      image: this.props.resData.image_url 
    }
  },

  render: function(){
    var restaurantLink = 'restaurants/' + this.props.resData.id;

    return(
      <a href={restaurantLink}>
        <div className="restaurant-card">
          <img src={this.state.image} />
          <h1>{this.state.name}</h1>
        </div>
      </a>
    )
  }
})