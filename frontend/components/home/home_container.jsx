import { connect } from 'react-redux';
import Home from './home';

// import { login, logout, signup } from '../actions/session_actions';
import { fetchRecipes } from '../../actions/recipe_actions';

const msp = state => ({
  // currentUser: state.entities.users[state.session.id],
  recipes: Object.values(state.entities.recipes)
})

const mdp = dispatch => ({
  // login: (user) => dispatch(login(user)),
  // logout: () => dispatch(logout()),
  // signup: (user) => dispatch(signup(user)),
  fetchRecipes: (filters) => dispatch(fetchRecipes(filters))
})

export default connect(msp, mdp)(Home);