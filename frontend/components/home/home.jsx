import React from 'react';

import SearchContainer from '../search/search_container';

class Home extends React.Component {

  componentDidMount() {
    this.props.fetchRecipes()
  }

  render() {

    return (
      <div id="home">
        <section>
          <SearchContainer />
        </section>
      </div>
    )
  }
}

export default Home;