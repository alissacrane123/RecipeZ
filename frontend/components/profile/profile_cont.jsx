import { connect } from 'react-redux';
import Profile from './profile';

import { fetchPlan, fetchPlans } from '../../actions/profile_actions';

const msp = state => {
  
  return {
    weekly_plans: state.entities.weekly_plans
  }
}

const mdp = dispatch => ({
  fetchPlan: () => dispatch(fetchPlan()),
  fetchPlans: () => dispatch(fetchPlans())
})

export default connect(msp, mdp)(Profile);