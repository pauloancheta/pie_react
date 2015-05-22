var IndexPage = React.createClass({

  render: function() {
    console.log(this.props.currentUser)
    var signup = <Signup user={this.props.user} />;
    var login = <Login />
    return(
      <div>
        <h1>Picky Eater</h1>
        { login }
        { signup }
        <a href='/logout'>Logout</a>
      </div>
    );
  }
});
