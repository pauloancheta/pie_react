var IndexPage = React.createClass({
  getInitialState: function(){
    return {restaurants: this.props.restaurants}
  },

  onRestaurantSubmit: function(e){
    e.preventDefault();
    var resName = React.findDOMNode(this.refs.resName).value + '',
     resAddress = React.findDOMNode(this.refs.resAddress).value + '',
       resEmail = React.findDOMNode(this.refs.resEmail).value + '',
       resPhone = React.findDOMNode(this.refs.resPhone).value + '',
       resImage = React.findDOMNode(this.refs.resImage).value + '';

    var newData = {name: resName, address: resAddress, email: resEmail, phone_number: resPhone, image_url: resImage}
    
    $.post('/restaurants', newData)

    // Reset values of forms
    React.findDOMNode(this.refs.resName).value = '';
    React.findDOMNode(this.refs.resAddress).value = '';
    React.findDOMNode(this.refs.resEmail).value = '';
    React.findDOMNode(this.refs.resPhone).value = '';
    React.findDOMNode(this.refs.resImage).value = '';
  },

  render: function(){
    restuarantArray = []
    this.state.restaurants.forEach(function(restaurant, key){
      restuarantArray.push(<Restaurant resName={restaurant.name} resImage={restaurant.image_url} key={key} />)
    });
    return(
      <div>
        <form onSubmit={this.onRestaurantSubmit}>
          <input type="text" placeholder="Restaurant Name" ref="resName"></input>
          <input type="text" placeholder="Restaurant Address" ref="resAddress"></input>
          <input type="text" placeholder="Restaurant Email" ref="resEmail"></input>
          <input type="text" placeholder="Restaurant Phone Number" ref="resPhone"></input>
          <input type="text" placeholder="Restaurant Image Url" ref="resImage"></input>
          <input type="submit"></input>
        </form>
        <div className="restaurants-container">
          {restuarantArray}
        </div>
      </div>
    )
  }
});