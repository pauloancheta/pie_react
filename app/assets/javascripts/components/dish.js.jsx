var Dish = React.createClass({
  getInitialState: function(){
    var menuId = this.props.dish.menu_id
    var dishId = this.props.dish.id
    var url = '/menus/' + menuId + '/dishes/' + dishId

    return {
      dish: this.props.dish,
      admin: this.props.user.is_admin,
      diets: this.props.diets,
      extras: this.props.extras,
      showUrl: url
    }
  },

  titleClick: function(){
    window.location(url)
  },

  render: function(){
    var adminTools = "";
    var extras= [];
    this.state.extras.forEach(function(extra){
      extras.push(<li>{extra.description}</li>)
    })

    return(
      <div className="dish-card">
        <a className="dish-card__title" href={this.state.showUrl}>{this.state.dish.name}</a>
        <p className="dish-card__price">{this.state.dish.price}</p>
        <p className="dish-card__description">{this.state.dish.description}</p>
        {extras}
        {adminTools}
      </div>
    )
  }
})