import React from 'react'

export default class Results extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div className="results">
        <p>Your brnr link is:</p>
        <h1>{this.props.link.url}</h1>
        <p>Thank you for using brnrs.io</p>
        <div className="button-wrap">
          <button className="btn btn-lg btn-left" onClick={this.props.resetSubmission}>&lt;&lt; Reset</button>
        </div>
      </div>
    );
  }
}
