import React from 'react';

class RecipeShow extends React.Component{
  constructor(props) {
    super(props);
    this.state = { groceries: [] }
    this.addItem = this.addItem.bind(this)
    this.removeItem = this.removeItem.bind(this)
  }

  componentDidMount() {
    this.props.fetchRecipe(Number(this.props.recipe_id))
  }

  removeItem(e) {
    e.preventDefault();
    let remove_item = e.currentTarget.value
    let new_groc = this.state.groceries.filter(item => item != remove_item)
    this.setState({ groceries: [new_groc] })  
    debugger
  }

  addItem(e) {
    e.preventDefault();
    let item = e.currentTarget.value 
    // debugger
    this.setState({ groceries: [...this.state.groceries, item] })
  }

  render() {
    let {recipe, ingredient} = this.props;   
    if (!recipe || !ingredient ) return null;

    let ingreds = ingredient.items.map(item => (
      <li>
        <button onClick={this.addItem} value={item}><span>+</span></button>
        <p>{item}</p>
      </li>))

    let dirs = recipe.directions.map(dir => <li>{dir}</li>)

    let groc = this.state.groceries.map(item => (
      <li>
        <button onClick={this.removeItem} value={item}><span>-</span></button>
        <p>{item}</p>
      </li>))

    if (this.state.groceries.length < 1) groc = <li></li>

    return (
      <div id="recipe">
        <div className="recipe">
          <img src={recipe.img_src}/>

          <header>
            <h1>{recipe.title.toUpperCase()}</h1>
          </header>

          <section id="ingred">
            <h4>Ingredients</h4>
            <ul>
              {ingreds}
            </ul>
          </section>

          <section id="dir">
            <h4>Directions</h4>
            <ol>
              {dirs}
            </ol>
          </section>
        </div>

        <div className="grocery">
          <h4>Groceries needed</h4>
          <ul>
            {groc}
          </ul>

          <button className="add">Add to Shopping List</button>
        </div>
      </div>
    )
  }
}

export default RecipeShow;