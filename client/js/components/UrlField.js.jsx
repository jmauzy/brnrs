import React from 'react'


export default class URLField extends React.Component {
  constructor() {
    super();
    this.saveAndContinue = this.saveAndContinue.bind(this);
  }

  saveAndContinue(e) {

    e.preventDefault();

    if (this.refs.target_url.value) {
      let data = {
        target_url: this.refs.target_url.value
      }

      this.props.saveValues(data)
      this.props.nextStep()
    }
  }


  render() {
    return (
      <div className="url-submission-field">
        <form onSubmit={this.saveAndContinue}>
          <div className="form-group">
            <input
              required
              type="url"
              placeholder="Enter a valid URL to get started."
              className="form-control input-lg"
              ref="target_url"
              id="target_url-input"
            />
          </div>
          <div className="button-wrap">
            <button type="submit" className="btn btn-lg button-right">Continue >></button>
          </div>
        </form>
      </div>
    );
  }
}
