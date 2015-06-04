var Dish = React.createClass({
  getInitialState: function(){
    return {dish: this.props.dishData, workflow: this.props.dishData.workflow_state}
  },

  changeState: function(e){
    e.preventDefault();
    var self = this;
    var url = "";
    if(this.state.workflow === 'draft'){
      url = "/publish_dish/"
    }
    
    $.ajax({
      url: url + this.state.dish.id,
      method: 'PATCH'
    })
  },

  render: function(){
    return(
      <div className="dish-card">
        <h1>{this.state.dish.name}</h1>
        <p>{this.state.dish.description}</p>
        <p>{this.state.dish.price}</p>
        <a onClick={this.changeState}>{this.state.workflow}</a>
      </div>
    )
  }
})

  // patch '/publish_dish/:id' => 'dishes#publish', as: :dishes_publish
  // patch '/pause_dish/:id' => 'dishes#pause', as: :dishes_pause
  // patch '/unpause_dish/:id' => 'dishes#unpause', as: :dishes_unpause
