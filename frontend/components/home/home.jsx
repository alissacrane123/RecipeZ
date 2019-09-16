import React from 'react';

class Home extends React.Component {

  componentDidMount() {
    this.props.fetchRecipes()
  }

  render() {

    return (
      <div>Home</div>
    )
  }
}

export default Home;