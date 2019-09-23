import React from 'react';
import { withRouter } from 'react-router-dom';

import LoginForm from '../session/login_form';
import SignupForm from '../session/signup_form';

class Navbar extends React.Component {




  render() {
    let { openModal, closeModal, currentUser, logout } = this.props;

    let navId = "navbar"
    if (this.props.history.location.pathname !== '/') {
      navId = "navbar2"
    }

    let loggedOut = (
      <div>
        <button onClick={() => openModal('login')}>Log In</button>
        <button onClick={() => openModal('signup')}>Sign Up</button>
      </div>
    )

    let loggedIn = (
      <div >
        <button onClick={() => logout()}>Logout</button>
      </div >
    )

    return (
      <div id={navId}>
        <div className="nav-logo">
          LOGO
        </div>

        {currentUser ? loggedIn : loggedOut}

      </div>
    )
  }
}

export default withRouter(Navbar);