var DishForm = React.createClass({
  getInitialState: function(){
    return{diets: this.props.diets}
  },

  dishFormHandler: function(e) {
    e.preventDefault();
    var dishName = React.findDOMNode(this.refs.dishName).value + '',
        dishDesc = React.findDOMNode(this.refs.dishDesc).value + '',
       dishPrice = React.findDOMNode(this.refs.dishPrice).value + '',
        dishMenu = React.findDOMNode(this.refs.menuID).value + '',
        dishDiet = React.findDOMNode(this.refs.dishDiet).value + '';

    var url = '/menus/' + dishMenu + '/dishes';
    $.post(url, {
      name: dishName, 
      description: dishDesc, 
      price: dishPrice, 
      menu_id: dishMenu,
      dish_diet: dishDiet
    })

    //reset values
    dishName = React.findDOMNode(this.refs.dishName).value = '';
    dishDesc = React.findDOMNode(this.refs.dishDesc).value = '';
    dishPrice = React.findDOMNode(this.refs.dishPrice).value = '';
  },

  render: function(){
    var dietOptions = []
    this.state.diets.forEach(function(diet){
      dietOptions.push(<option value={diet.id}>{diet.name}</option>)
    })
    return(
      <div className="dish-form">
        <h1>New Dish</h1>
        <form onSubmit={this.dishFormHandler}>
          <input type="text" ref="dishName" placeholder="Dish Name"></input><br />
          <input type="text" ref="dishDesc" placeholder="Dish Description"></input><br />
          <input type="text" ref="dishPrice" placeholder="Dish Price"></input><br />
          Diet: <select ref="dishDiet">
            {dietOptions}
          </select><br />
          Menu: <select ref="menuID">
            {this.props.menuOptions}
          </select><br />
          <input type="submit"></input>
        </form>
      </div>
    )
  }
})