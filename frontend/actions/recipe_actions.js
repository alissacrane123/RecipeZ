import * as RecipeUtil from '../util/recipe_api_util'

export const RECEIVE_RECIPES = 'RECEIVE_RECIPES';
export const RECEIVE_RECIPE = 'RECEIVE_RECIPE';

export const receiveRecipes = recipes => {
  return {
    type: RECEIVE_RECIPES,
    recipes
  }
}

export const receiveRecipe = recipe => {
  return {
    type: RECEIVE_RECIPE,
    recipe
  }
}

export const fetchRecipes = filters => dispatch => {
  return (
    RecipeUtil.fetchRecipes(filters).then(recipes => dispatch(receiveRecipes(recipes)))
  )
}

export const fetchRecipe = id => dispatch => {
  return (
    RecipeUtil.fetchRecipe(id).then(recipe => dispatch(receiveRecipe(recipe)))
  )
}
