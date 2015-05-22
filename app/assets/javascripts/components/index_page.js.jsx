var IndexPage = React.createClass({
  getInitialState: function(){
    var user = this.props.user
    return { user: user }
  },

  userSubmitHandler: function(e){
    e.preventDefault();
    var newUserName             = React.findDOMNode(this.refs.newUserName).value;
    var newUserEmail            = React.findDOMNode(this.refs.newUserEmail).value;
    var newUserPassword         = React.findDOMNode(this.refs.newUserPassword).value;
    var newUserPasswordConfirm  = React.findDOMNode(this.refs.newUserPasswordConfirm).value;
    
    var data = {
      name: newUserName,
      email: newUserEmail,
      password: newUserPassword,
      password_confirmation: newUserPasswordConfirm,
    }
    
    // create post in the database
    $.post('/users', data);

    console.log('new user submited');
  },

  render: function() {
    return(
      <div>
        <h1>Picky Eater</h1>
        <h2>Sign In</h2>
        <form onSubmit={this.userSubmitHandler}>
          <input type='text' placeholder='User Name' ref='newUserName'></input> <br />
          <input type='text' placeholder='Email' ref='newUserEmail'></input> <br />
          <input type='password' placeholder='Password' ref='newUserPassword'></input> <br />
          <input type='password' placeholder='Password Confirmation' ref='newUserPasswordConfirm'></input> <br />
          <input type='submit'></input>
        </form>
      </div>
    );
  }
});
