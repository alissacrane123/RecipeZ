import { connect } from 'react-redux';

import Modal from './modal';
import { closeModal } from '../../actions/modal_actions';
import { login, signup } from '../../actions/session_actions';

const msp = state => {

  return {
    modal: state.ui.modal,
    errors: state.errors.session
  }
}

const mdp = dispatch => {

  return {
    login: (user) => dispatch(login(user)),
    signup: (user) => dispatch(signup(user)),
    closeModal: () => dispatch(closeModal())
  }
}

export default connect(msp, mdp)(Modal);