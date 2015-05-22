var Login = React.createClass({
  loginSubmit: function(){
    var loginUserEmail = React.findDOMNode(this.refs.loginUserEmail).value;
    var loginUserPassword = React.findDOMNode(this.refs.loginUserPassword).value;

    var data = {
      email: loginUserEmail,
      password: loginUserPassword
    }

    $.post('/login', data);
  },

  render: function(){
    return(
      <div>
        <h2>Login</h2>
        <form onSubmit={this.loginSubmit} >
          <input type="text" placeholder="email" ref="loginUserEmail"></input> <br />
          <input type="password" placeholder="password" ref="loginUserPassword"></input> <br />
          <input type="submit"></input>
        </form>
      </div>
    )
  }
});