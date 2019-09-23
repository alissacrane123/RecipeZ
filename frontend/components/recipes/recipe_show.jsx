import React from 'react';

class RecipeShow extends React.Component{

  componentDidMount() {
    // debugger
    this.props.fetchRecipe(Number(this.props.recipe_id))
  }

  render() {

    return (
      <div>recipe</div>
    )
  }
}

export default RecipeShow;