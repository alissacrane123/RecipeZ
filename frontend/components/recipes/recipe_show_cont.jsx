import { connect } from 'react-redux';

import RecipeShow from './recipe_show';

import { fetchRecipes, fetchRecipe } from '../../actions/recipe_actions';

const msp = (state, ownProps) => {
  let recipe_id = ownProps.match.params["recipeId"]
  // debugger
  return {
    recipe_id: ownProps.match.params["recipeId"],
    recipe: state.entities.recipes[recipe_id]
    // ingredient: state.entities.ingredients
  }
}

const mdp = dispatch => ({
  fetchRecipe: (id) => dispatch(fetchRecipe(id))
})

export default connect(msp, mdp)(RecipeShow);