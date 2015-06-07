var DishForm = React.createClass({
  dishFormHandler: function(e) {
    e.preventDefault();
    var dishName = React.findDOMNode(this.refs.dishName).value + '',
        dishDesc = React.findDOMNode(this.refs.dishDesc).value + '',
       dishPrice = React.findDOMNode(this.refs.dishPrice).value + '',
        dishMenu = React.findDOMNode(this.refs.menuID).value + '';

    var url = '/menus/' + dishMenu + '/dishes';
    $.post(url, {
      name: dishName, 
      description: dishDesc, 
      price: dishPrice, 
      menu_id: dishMenu,
    })

    //reset values
    dishName = React.findDOMNode(this.refs.dishName).value = '';
    dishDesc = React.findDOMNode(this.refs.dishDesc).value = '';
    dishPrice = React.findDOMNode(this.refs.dishPrice).value = '';
  },

  render: function(){
    return(
      <div className="dish-form">
        <h1>New Dish</h1>
        <form onSubmit={this.dishFormHandler}>
          <input type="text" ref="dishName" placeholder="Dish Name"></input><br />
          <input type="text" ref="dishDesc" placeholder="Dish Description"></input><br />
          <input type="text" ref="dishPrice" placeholder="Dish Price"></input><br />
          Menu: <select ref="menuID">
            {this.props.menuOptions}
          </select><br />
          <input type="submit"></input>
        </form>
      </div>
    )
  }
})