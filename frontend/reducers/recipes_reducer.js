import { RECEIVE_RECIPES, RECEIVE_RECIPE } from '../actions/recipe_actions';

const recipesReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_RECIPES:
      debugger
      return action.recipes;
    case RECEIVE_RECIPE:
      const newRecipe = { [action.recipe.id]: action.recipe };
      return Object.assign(nextState, newRecipe);
    default:
      return state;
  }
}

export default recipesReducer;