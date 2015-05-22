var IndexPage = React.createClass({
  getInitialState: function(){
    return { currentUser: this.props.current_user }
  },

  componentDidMount: function(){
    console.log(this.state.currentUser)
  },

  loginSubmit: function(){
    var loginUserName = React.findDOMNode(this.refs.loginUserName).value;
    var loginUserPassword = React.findDOMNode(this.refs.loginUserPassword).value;

    var data = {
      name: loginUserName,
      password: loginUserPassword
    }

    $.post('/login', data);
  },

  render: function() {
    var login = <Signup user={this.props.user} />;
    var lol = <h1>LOL</h1>
    return(
      <div>
        <h1>Picky Eater</h1>

        <h2>Login</h2>
        <form onSubmit={this.loginSubmit} >
          <input type="text" placeholder="user name" rel="loginUserName"></input> <br />
          <input type="password" placeholder="password" rel="loginUserPassword"></input> <br />
          <input type="submit"></input>
        </form>

        { this.state.currentUser ? lol : login }
        <a href='/logout'>Logout</a>
      </div>
    );
  }
});
