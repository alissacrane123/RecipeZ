import { connect } from 'react-redux';

import Search from './search';

import { fetchRecipes } from '../../actions/recipe_actions';

const msp = state => ({
  recipes: Object.values(state.entities.recipes)
})

const mdp = dispatch => ({
  fetchRecipes: (filters) => dispatch(fetchRecipes(filters))
})

export default connect(msp, mdp)(Search);