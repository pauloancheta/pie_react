var MenuToolbar = React.createClass({
  getInitialState: function(){
    return {restaurant: this.props.restaurant, menus: this.props.menus}
  },

  menuFormHandler: function(e) {
    e.preventDefault();
    var menuName = React.findDOMNode(this.refs.menuName).value + '';
    var menuStart = React.findDOMNode(this.refs.menuStart).value + '';
    var menuEnd = React.findDOMNode(this.refs.menuEnd).value + '';
    var url = '/restaurants/' + this.state.restaurant.id + '/menus'
    $.post(url, {
      name: menuName,
      menuStart: menuStart,
      menuEnd: menuEnd
    });

    // reset values
    React.findDOMNode(this.refs.menuName).value = '';
  },

  dishFormHandler: function(e) {
    e.preventDefault();
    var dishName = React.findDOMNode(this.refs.dishName).value + '',
        dishDesc = React.findDOMNode(this.refs.dishDesc).value + '',
       dishPrice = React.findDOMNode(this.refs.dishPrice).value + '',
        dishMenu = React.findDOMNode(this.refs.menuID).value + '',
        dishDiet = React.findDOMNode(this.refs.dishDiet).value + '',
     dishOptDiet = React.findDOMNode(this.refs.dishOptDiet).value + '';

    var url = '/menus/' + dishMenu + '/dishes';
    $.post(url, {
      name: dishName, 
      description: dishDesc, 
      price: dishPrice, 
      menu_id: dishMenu,
      primary_diet: dishDiet,
      optional_diet: dishOptDiet
    })

    //reset values
    dishName = React.findDOMNode(this.refs.dishName).value = '';
    dishDesc = React.findDOMNode(this.refs.dishDesc).value = '';
    dishPrice = React.findDOMNode(this.refs.dishPrice).value = '';
  },

  render: function() {
    var menuOptions = []
    var dietOptions = [
      (<option value="Default">Default</option>),
      (<option value="Vegetarian">Vegetarian</option>),
      (<option value="Gluten Free">Gluten Free</option>)
      ]
    this.state.menus.forEach(function(menu){
      menuOptions.push(<option value={menu.id}> {menu.name} </option>)
    })
    return(
      <div className="new-menu-form">
        <h1>New Menu</h1>
        <form onSubmit={this.menuFormHandler}>
          <input type="text" ref="menuName" placeholder="Menu Name"></input><br />
          <input type="time" ref="menuStart"> Start Time</input><br />
          <input type="time" ref="menuEnd"> End Time</input><br />
          <input type="submit"></input>
        </form>

        <h1>New Dish</h1>
        <form onSubmit={this.dishFormHandler}>
          <input type="text" ref="dishName" placeholder="Dish Name"></input><br />
          <input type="text" ref="dishDesc" placeholder="Dish Description"></input><br />
          <input type="text" ref="dishPrice" placeholder="Dish Price"></input><br />
          Primary Diet: <select ref="dishDiet">
            {dietOptions}
          </select>
          Optional Diet: <select ref="dishOptDiet">
            {dietOptions}
          </select>
          <select ref="menuID">
            {menuOptions}
          </select><br />
          <input type="submit"></input>
        </form>
      </div>
    )
  }
})