var IndexPage = React.createClass({
  getInitialState: function(){
    return {user: this.props.user, restaurants: this.props.restaurants}
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
    var restuarantCards = [],
        createRestaurant = [];

    if(this.state.user.name === 'Paulo'){
      createRestaurant = (
        <form onSubmit={this.onRestaurantSubmit}>
          <input type="text" placeholder="Restaurant Name" ref="resName"></input><br />
          <input type="text" placeholder="Restaurant Address" ref="resAddress"></input><br />
          <input type="text" placeholder="Restaurant Email" ref="resEmail"></input><br />
          <input type="text" placeholder="Restaurant Phone Number" ref="resPhone"></input><br />
          <input type="text" placeholder="Restaurant Image Url" ref="resImage"></input><br />
          <input type="submit"></input>
        </form>
      )
    }
    this.state.restaurants.forEach(function(restaurant, key){
      restuarantCards.push(<Restaurant resData={restaurant} key={key} />)
    });

    return(
      <div>
        <div className="create-restaurant">
        </div>
        {createRestaurant}
        <div className="restaurants-container">
          {restuarantCards}
        </div>
      </div>
    )
  }
});