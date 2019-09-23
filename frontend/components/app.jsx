
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
import NavbarContainer from './navbar/navbar_container';
import ModalContainer from './modal/modal_container';

const App = () => (
  <div id="app">
    <ModalContainer />
    <NavbarContainer />

    <Switch>
      <Route path="/search/:searchQuery" component={RecipeContainer} />
      <Route exact path="/" component={HomeContainer} />
    </Switch>
    
  </div>
);

export default App;