var Restaurant = React.createClass({
  getInitialState: function(){
    return { name: this.props.resName, image: this.props.resImage }
  },

  render: function(){
    var restaurantLink = 'restaurants/' + this.props.resID;
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