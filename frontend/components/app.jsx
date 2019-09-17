
import React from 'react';
import { Provider } from 'react-redux';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';

import HomeContainer from './home/home_container';
import RecipeContainer from './recipes/recipes_index_cont';

const App = () => (
  <div id="app">
    <Switch>
      <Route path="/search/results" component={RecipeContainer} />
      <Route exact path="/" component={HomeContainer} />
    </Switch>
  </div>
);

export default App;