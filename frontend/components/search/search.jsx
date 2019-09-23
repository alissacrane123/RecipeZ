import React from 'react';
import { withRouter } from 'react-router';

class Search extends React.Component {
  constructor(props) {
    super(props)
    this.state = { main: '', num_ingred: "How difficult?", num_dir: null, df: false }
    this.handleChange = this.handleChange.bind(this)
    this.handleSelect = this.handleSelect.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleSelect(e) {
    // let num = Number(e.target.value)
    this.setState({num_ingred: e.target.value})
  }

  handleChange(e) {
    this.setState({ main: e.target.value })
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchRecipes(this.state)
    let query = this.state.main
    let num = this.state.num_ingred;
    // debugger
    num = typeof num === 'string' ? 0 : num;
    this.props.history.push(`/search/m=${query}&n=${num}`)
  }

  render() {

    return (
      <div id="search">
        <form onSubmit={this.handleSubmit}>
          <input type="text"
            onChange={this.handleChange} 
            placeholder="What are you craving?" 
            value={this.state.main} />

          <div>
            <select value={this.state.num_ingred} onChange={this.handleSelect}>
              <option value="200">How difficult?</option>
              <option value="10">Easy</option>
              <option value="20">Medium</option>
              <option value="200">Hard</option>
            </select>
          </div>

          <input type="submit" value="Search"/>
        </form>
      </div>
    )
  }
}

export default withRouter(Search);