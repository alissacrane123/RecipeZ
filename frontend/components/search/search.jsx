import React from 'react';
import { withRouter } from 'react-router';

class Search extends React.Component {
  constructor(props) {
    super(props)
    this.state = { main: '', ingred: [], current: '', num_dir: null, df: false }
    this.handleChange = this.handleChange.bind(this)
    this.handleChange2 = this.handleChange2.bind(this)
    this.handleClick = this.handleClick.bind(this)
    this.handleSelect = this.handleSelect.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleClick(e) {
    e.preventDefault()

    let new_ingred = this.state.current

    this.setState({ ingred: [...this.state.ingred, new_ingred] })
    this.setState({current: ''})
  }


  handleChange2(e) {
      this.setState({current: e.target.value})
  }

  handleSelect(e) {

    this.setState({num_ingred: e.target.value})
  }

  handleChange(e) {
    // debugger
    this.setState({ main: e.target.value })
  }

  handleSubmit(e) {
    e.preventDefault();
    // debugger
    this.props.fetchRecipes(this.state)
    let query = this.state.main
    let ingreds = this.state.ingred.join('+')
    // debugger
    this.props.history.push(`/search/m=${query}&n=${ingreds}`)
  }

  render() {
    let ingreds = this.state.ingred.map(ingred => (
      <li>{`x  ${ingred}`}</li>))

    return (
      <div id="search" className="search">

        {/* <div className="search"> */}
          <form>
            <input type="text"
              onChange={this.handleChange} 
              placeholder="What are you in the mood for?" 
              value={this.state.main} />

            <div>
              <input
                onChange={this.handleChange2}
                placeholder="Ingredients"
                value={this.state.current} />
              <button onClick={this.handleClick}>+</button>
            </div>

            {/* <div>
              <select value={this.state.num_ingred} onChange={this.handleSelect}>
                <option value="200">How difficult?</option>
                <option value="10">Easy</option>
                <option value="20">Medium</option>
                <option value="200">Hard</option>
              </select>
            </div> */}

            <input type="submit" value="Search" onClick={this.handleSubmit}/>
          </form>
        {/* </div> */}

        <ul>
            {ingreds}
        </ul>
      </div>
    )
  }
}

export default withRouter(Search);