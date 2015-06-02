var NewMenu = React.createClass({
  getInitialState: function(){
    return {restaurant: this.props.restaurant, menus: this.props.menus}
  },

  menuFormHandler: function(e) {
    e.preventDefault();
    var menuName = React.findDOMNode(this.refs.menuName).value + '';
    var url = '/restaurants/' + this.state.restaurant.id + '/menus'
    $.post(url, {name: menuName});

    // reset values
    React.findDOMNode(this.refs.menuName).value = '';
  },

  dishFormHandler: function(e) {
    e.preventDefault();
    var dishName = React.findDOMNode(this.refs.dishName).value + '',
        dishDesc = React.findDOMNode(this.refs.dishDesc).value + '',
       dishPrice = React.findDOMNode(this.refs.dishPrice).value + '',
        dishMenu = React.findDOMNode(this.refs.menuID).value + '';
    var url = '/menus/' + dishMenu + '/dishes';
    $.post(url, {name: dishName, description: dishDesc, price: dishPrice, menu_id: dishMenu})

    //reset values
    dishName = React.findDOMNode(this.refs.dishName).value = '';
    dishDesc = React.findDOMNode(this.refs.dishDesc).value = '';
    dishPrice = React.findDOMNode(this.refs.dishPrice).value = '';
  },

  render: function() {
    var menuOptions = []
    this.state.menus.forEach(function(menu){
      menuOptions.push(<option value={menu.id}> {menu.name} </option>)
    })
    return(
      <div className="new-menu-form">
        <h1>New Menu</h1>
        <form onSubmit={this.menuFormHandler}>
          <input type="text" ref="menuName" placeholder="Menu Name"></input>
          <input type="submit"></input>
        </form>

        <h1>New Dish</h1>
        <form onSubmit={this.dishFormHandler}>
          <input type="text" ref="dishName" placeholder="Dish Name"></input>
          <input type="text" ref="dishDesc" placeholder="Dish Description"></input>
          <input type="text" ref="dishPrice" placeholder="Dish Price"></input>
          <select ref="menuID">
            {menuOptions}
          </select>
          <input type="submit"></input>
        </form>
      </div>
    )
  }
})