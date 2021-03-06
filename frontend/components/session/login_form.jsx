import React from 'react';

class LoginForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { email: '', password: '' }
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.login(this.state)
      .then(this.props.closeModal)
  }

  handleChange(field) {
    return (e) => { this.setState({ [field]: e.target.value }) }
  }

  render() {
    let errors = this.props.errors.join('. ');

    return (
      <form className="session">
        <h4>Log in</h4>

        <input placeholder="email address" value={this.state.email} onChange={this.handleChange('email')} />

        <input placeholder="password" value={this.state.password} onChange={this.handleChange('password')} />

        <div className="errors-cont">
          {errors}
        </div>

        <button onClick={this.handleSubmit} className="add">Sign Up</button>
        {/* <input className="login-button" type="submit" value="Login" /> */}
      </form>

    )
  }
}

export default LoginForm;