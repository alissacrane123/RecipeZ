import { combineReducers } from 'redux';

import usersReducer from './users_reducer';
import recipesReducer from './recipes_reducer';
import ingredientsReducer from  './ingredients_reducer';
import plansReducer from './plans_reducer';

const entitiesReducer = combineReducers({
  users: usersReducer,
  weekly_plans: plansReducer,
  recipes: recipesReducer,
  ingredients: ingredientsReducer
});

export default entitiesReducer;