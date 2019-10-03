import * as ProfileUtil from '../util/profile_api_util';
import Profile from '../components/profile/profile';

export const RECEIVE_PLAN = 'RECEIVE_PLAN';
export const RECEIVE_PLANS = 'RECEIVE_PLANS';

export const receivePlan = (payload) => {
  return {
    type: RECEIVE_PLAN,
    payload
  }
}

export const receivePlans = payload => {
  return {
    type: RECEIVE_PLANS,
    payload
  }
}

export const fetchPlan = () => dispatch => {
  return (
    ProfileUtil.fetchPlan().then(plan => dispatch(receivePlan(plan)))
  )
}

export const fetchPlans = () => dispatch => {
  return (
    ProfileUtil.fetchPlans().then(plans => dispatch(receivePlans(plans)))
  )
}