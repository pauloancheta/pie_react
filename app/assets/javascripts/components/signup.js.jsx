var Signup = React.createClass({
  getInitialState: function(){
    return { user: this.props.user }
  },

  userSubmitHandler: function(){
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
    
    $.post('/users', data);
  },

  render: function(){
    return(
      <div className='login_form'>
        <h2>Sign In</h2>
        <form onSubmit={this.userSubmitHandler}>
          <input type='text' placeholder='User Name' ref='newUserName'></input> <br />
          <input type='text' placeholder='Email' ref='newUserEmail'></input> <br />
          <input type='password' placeholder='Password' ref='newUserPassword'></input> <br />
          <input type='password' placeholder='Password Confirmation' ref='newUserPasswordConfirm'></input> <br />
          <input type='submit'></input>
        </form>
      </div>
    )
  }
})