import React from 'react';
import { withRouter } from 'react-router-dom';

import RecipeItem from './recipe_item';

class RecipesIndex extends React.Component {

  componentDidMount() {
    // debugger
    let queries = this.props.searchQuery.split('&');
    let main = queries[0].slice(2);
    let ingred = queries[1].slice(2);

    this.props.fetchRecipes({ main: main, ingreds: ingred});
  }

  render() {
    let {recipes, history} = this.props;
    // let recipes = this.props.recipes;

    // recipes = recipes.map { |rec| rec.title };
    recipes = recipes.map(rec => (
      <RecipeItem key={rec.id} recipe={rec} /> ));

    return (
      <div id="index">
        <section>
          filter form
        </section>

        <section id="items">

        {recipes}
        </section>

      </div>
    )
  }
}

export default withRouter(RecipesIndex);