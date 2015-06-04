var Dish = React.createClass({
  getInitialState: function(){
    return {
      dish: this.props.dishData, 
      workflow: this.props.dishData.workflow_state
    }
  },

  changeState: function(e){
    e.preventDefault();
    var self = this;
    var url = '';
    if(this.state.workflow === 'draft'){
      url = '/publish_dish/'
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

  render: function(){
    return(
      <div className="dish-card">
        <h2 className="dish-card__title">{this.state.dish.name}</h2>
        <p className="dish-card__price">{this.state.dish.price}</p>
        <p className="dish-card__description">{this.state.dish.description}</p>
        <a onClick={this.changeState} className="button">{this.state.workflow}</a>
      </div>
    )
  }
})