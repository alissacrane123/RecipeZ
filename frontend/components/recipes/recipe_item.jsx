import React from 'react';
import { withRouter }  from 'react-router-dom';

const RecipeItem = (props) => {

  let recipe = props.recipe
  // debugger
  return (
    <div id="rec-item" onClick={() => props.history.push(`/recipes/${recipe.id}`)}>
      {/* {recipe.title} */}
      <div>
        <img src={recipe.img_src} alt=""/>
      </div> 

      <h4>{recipe.title}</h4>
    </div>
  )
}

export default withRouter(RecipeItem);