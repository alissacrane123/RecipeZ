export const fetchRecipes = filters => {
  // debugger
  return $.ajax({
    method: 'GET',
    url: '/api/recipes',
    data: { filters }
  })
} 

export const fetchRecipe = id => {

  return $.ajax({
    method: 'GET',
    url: `/api/recipes/${id}`
  })
}