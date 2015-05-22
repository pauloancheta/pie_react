var IndexPage = React.createClass({
  getInitialState: function(){
    return { currentUser: this.props.current_user }
  },

  componentDidReceiveProps: function(){
    console.log('index page recieved something')
  },

  render: function() {
    var login = <Login user={this.props.user} />;
    var lol = <h1>LOL</h1>
    return(
      <div>
        <h1>Picky Eater</h1>
        { this.state.currentUser ? lol : login }
      </div>
    );
  }
});
