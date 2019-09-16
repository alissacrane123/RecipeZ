
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

const App = () => (
  <div>
    <Route exact path="/" component={HomeContainer} />
  </div>
);

export default App;