import React from 'react';

class RecipesIndex extends React.Component {

  render() {
    let recipes = this.props.recipes;
    // debugger

    // recipes = recipes.map { |rec| rec.title };
    recipes = recipes.map(rec => (
      <div>{rec.title}</div>));

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

export default RecipesIndex;