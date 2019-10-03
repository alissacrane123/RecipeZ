import React from 'react';

class Profile extends React.Component {

  render() {
    let { weekly_plans } = this.props

    if (!weekly_plans) return null

    return (
      <div>

      </div>
    )
  }
}

export default Profile