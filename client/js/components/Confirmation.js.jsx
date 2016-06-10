import React from 'react'
import moment from 'moment'

export default class Confirmation extends React.Component {
  constructor(props) {
    super(props);
    this.goBack = this.goBack.bind(this);
  }

  goBack(e) {
    e.preventDefault();
    this.props.previousStep();
  }

  render() {
    let formattedExpiration = moment(this.props.expiration*1000).format('MMMM Do YYYY, hh:mm a')
    return <div className="confirmation">
      <p>You are creating a link that redirects to:</p>
      <p>{this.props.target_url}</p>
      <p>It will expire: {formattedExpiration}</p>
      <p>Or after {this.props.max_redirects} uses</p>
      <button className="btn btn-lg submission-button button-left" onClick={this.goBack}>&lt;&lt; Go Back</button>
      <button className="btn btn-lg submission-button button-right" onClick={this.props.submit}>Submit &gt;&gt;</button>
    </div>
  }
}
