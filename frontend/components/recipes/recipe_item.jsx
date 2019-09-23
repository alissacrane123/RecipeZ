import React from 'react';

const RecipeItem = (props) => {

  let recipe = props.recipe
  // debugger
  return (
    <div id="rec-item">
      {/* {recipe.title} */}
      <div>
      <img src={recipe.img_src} alt=""/>
      </div> 
    </div>
  )
}

export default RecipeItem;