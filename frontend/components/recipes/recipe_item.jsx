import React from 'react';
import { withRouter }  from 'react-router-dom';

const RecipeItem = (props) => {

  let recipe = props.recipe
  // debugger
  return (
    <div id="rec-item" onClick={() => props.history.push(`/recipe/${recipe.id}`)}>
      {/* {recipe.title} */}
      <div>
      <img src={recipe.img_src} alt=""/>
      </div> 
    </div>
  )
}

export default withRouter(RecipeItem);