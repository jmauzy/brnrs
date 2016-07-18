import React from 'react'
import moment from 'moment';
import DateTimeField from 'react-bootstrap-datetimepicker-noicon';
import 'react-bootstrap-datetimepicker-noicon/css/bootstrap-datetimepicker.min.css';

export default class ExpirationFields extends React.Component {
  constructor(props) {
    super(props);
    this.setState = this.setState.bind(this);
    this.saveAndContinue = this.saveAndContinue.bind(this);
    this.goBack = this.goBack.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.state = {
      expiration: null
    }
  }

  saveAndContinue(e) {
    e.preventDefault();

    let data = {
      max_redirects: this.refs.max_redirects.value,
      expiration: this.state.expiration
    };

    this.props.saveValues(data);
    this.props.nextStep();
  }

  goBack(e) {
    e.preventDefault();
    this.props.previousStep();
  }

  handleChange(newDate) {
    this.setState({expiration: newDate/1000});
  }

  render() {
    return (
      <div className="expiration-submission-fields">
        <form onSubmit={this.saveAndContinue}>
          <div className="form-group">
            <input
              required
              type="number"
              min="0"
              max="1000000"
              placeholder="Uses before deletion (0 = no limit)"
              className="form-control input-lg"
              id="max_redirects-input"
              ref="max_redirects"/>
          </div>

          <div className="form-group">
            <div style={{position: 'relative'}}>
              <DateTimeField 
                required
                placeholder="Expiration date"
                size="lg"
                defaultText="Date/Time for deletion"
                minDate={moment()}
                maxDate={moment().add(1, 'years')}
                onChange={this.handleChange}
              />
            </div>
          </div>

          <div className="button-wrap">
            <button className="btn btn-lg submission-button button-left"onClick={this.goBack}>&lt;&lt; Back</button>
              <button type="submit" className="btn btn-lg submission-button button-right">Review &gt;&gt;</button>
          </div>
        </form>
      </div>
    )
  }
}
