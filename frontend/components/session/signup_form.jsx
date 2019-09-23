import React from 'react';

class SignupForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { email: '', password: '', fname: '', lname: '', city: ''};
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleChange = this.handleChange.bind(this)
  }

  handleChange(field) {
    return (e) => this.setState({ [field]: e.target.value })
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.signup(this.state)
      .then(this.props.closeModal)
  }

  render() {
    let errors = this.props.errors.join('. ');

    return (
      <div id="signup-form">
        <form  onSubmit={this.handleSubmit}>

          <h3>Sign Up</h3>

          <div className="signup-names">
            <input onChange={this.handleChange('fname')} value={this.state.fname} placeholder="first" />
            <input onChange={this.handleChange('lname')} value={this.state.lname} placeholder="last" />
          </div>


          <input onChange={this.handleChange('email')} value={this.state.email} placeholder="email" />

          <input onChange={this.handleChange('password')} value={this.state.password} placeholder="password" />

          <input onChange={this.handleChange('city')} value={this.state.city} placeholder="city" />

          <div className="errors-cont">
            {errors}
          </div>

          <input className="signup-button" type="submit" value="signup" />
        </form>

      </div>
    )
  }
}

export default SignupForm