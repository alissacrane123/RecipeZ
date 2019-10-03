import { RECEIVE_PLANS, RECEIVE_PLAN } from '../actions/profile_actions';

const plansReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_PLANS:
      // debugger
      return action.payload.weekly_plans;
    case RECEIVE_PLAN:
      // debugger
      const newPlan = { [action.payload.weekly_plan.id]: action.payload.weekly_plan };
      return Object.assign(nextState, newPlan);
    default:
      return state;
  }
}

export default plansReducer;