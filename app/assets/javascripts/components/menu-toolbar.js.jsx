var MenuToolbar = React.createClass({
  getInitialState: function(){
    return {restaurant: this.props.restaurant, menus: this.props.menus}
  },

  menuFormHandler: function(e) {
    e.preventDefault();
    var menuName = React.findDOMNode(this.refs.menuName).value + '';
    var menuDesc = React.findDOMNode(this.refs.menuDesc).value + '';
    var menuStart = React.findDOMNode(this.refs.menuStart).value + '';
    var menuEnd = React.findDOMNode(this.refs.menuEnd).value + '';

    var menuStartDate = React.findDOMNode(this.refs.menuEnd).value + '';
    var menuEndDate = React.findDOMNode(this.refs.menuEnd).value + '';

    var url = '/restaurants/' + this.state.restaurant.id + '/menus'
    $.post(url, {
      name: menuName,
      description: menuDesc,
      timeStart: menuStart,
      timeEnd: menuEnd,
      startDate: menuStartDate,
      endDate: menuEndDate
    });

    // reset values
    React.findDOMNode(this.refs.menuName).value = '';
    React.findDOMNode(this.refs.menuDesc).value = '';
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
          <input type="text" ref="menuName" placeholder="Menu Name"></input><br />
          <input type="text" ref="menuDesc" placeholder="Menu Description"></input><br />
          <input type="time" ref="menuStart"> Start Time</input><br />
          <input type="time" ref="menuEnd"> End Time</input><br />
          <input type="date" ref="menuStartDate"> Start Date</input><br />
          <input type="date" ref="menuEndDate"> End Date</input><br />
          <input type="submit"></input>
        </form>
        <DishForm menuOptions={menuOptions}/>
      </div>
    )
  }
})