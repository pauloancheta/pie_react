var Dish = React.createClass({
  getInitialState: function(){
    return {
      dish: this.props.dishData,
      admin: this.props.user.is_admin,
      diets: this.props.diets
    }
  },

  deleteDish: function(e){
    e.preventDefault
    var answer = confirm('Are you sure you want to delete this dish?')
    var id = this.state.dish.id
    if(answer){
      $.ajax({
        url: '/dishes/' + id,
        method: 'DELETE'
      })
    }
  },

  clickHandler: function(){
    console.log('CLICKED!')
  },

  render: function(){
    var adminTools = "";
    var diets = [];
    this.state.diets.forEach(function(diet){
      diets.push(<input type="checkbox" onClick={this.clickHandler}>{diet.name}</input>)
    })
    
    if(this.state.admin){
      adminTools = (
        <div>
          <a onClick={this.deleteDish} className="button">Delete</a>
        </div>)
    }
    return(
      <div className="dish-card">
        <h2 className="dish-card__title">{this.state.dish.name}</h2>
        <p className="dish-card__price">{this.state.dish.price}</p>
        <p className="dish-card__description">{this.state.dish.description}</p>
        {adminTools}
      </div>
    )
  }
})