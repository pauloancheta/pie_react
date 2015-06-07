var Dish = React.createClass({
  getInitialState: function(){
    return {
      dish: this.props.dishData, 
      workflow: this.props.dishData.workflow_state,
      admin: this.props.user.is_admin
    }
  },

  changeState: function(e){
    e.preventDefault();
    var self = this;
    var url = '';
    if(this.state.workflow === 'draft'){
      url = '/publish_dish/'
      this.setState({workflow: 'available'})
    }
    else if(this.state.workflow === 'available'){
      url = '/pause_dish/'
      this.setState({workflow: 'unavailable'})
    }
    else if(this.state.workflow === 'unavailable'){
      url = '/unpause_dish/'
      this.setState({workflow: 'available'})
    }
    
    $.ajax({
      url: url + this.state.dish.id,
      method: 'PATCH'
    })
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

  render: function(){
    var changeState = ""
    if(this.state.admin){
      changeState = (
        <div>
          <p className="diet"></p>
          <a onClick={this.changeState} className="button">{this.state.workflow}</a>
          <a onClick={this.deleteDish} className="button">Delete</a>
        </div>)
    }
    return(
      <div className="dish-card">
        <h2 className="dish-card__title">{this.state.dish.name}</h2>
        <p className="dish-card__price">{this.state.dish.price}</p>
        <p className="dish-card__description">{this.state.dish.description}</p>
        {changeState}
      </div>
    )
  }
})