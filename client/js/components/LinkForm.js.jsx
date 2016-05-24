import React from 'react';
import Formsy from 'formsy-react';
import moment from 'moment';
import DateTimeField from 'react-bootstrap-datetimepicker';
import 'react-bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css';

var LinkForm = React.createClass({
  getInitialState() {
    return {
      canSubmit: false
    }
  },
  enableButton() {
    this.setState({
      canSubmit: true
    });
  },
  disableButton() {
    this.setState({
      canSubmit: false
    });
  },
  createLink(event) {
    var link = { 
      target_url: this.refs.target_url.state.value,
      max_redirects: this.refs.max_redirects.state.value,
      //divide resulting unix timestamp to account for milliseconds
      expiration: this.refs.expiration.state.value / 1000
    }
    this.props.addLink(link);
  },
  render: function() {
    return(
      <Formsy.Form 
        onValidSubmit={this.createLink} 
        onValid={this.enableButton} 
        onInvalid={this.disableButton}>
        <URLEntry 
          name="target_url" 
          ref="target_url" 
          urlPlaceholder={this.props.urlPlaceholder}
          validations="isUrl"
          validationError="Invalid URL"
        />
        <RedirectsEntry 
          name="max_redirects"
          ref="max_redirects" 
          defaultRedirects={this.props.defaultRedirects}
          validations="isNumeric"
          validationError="Please enter a number 0-1000000"
        />
        <ExpirationEntry 
          ref="expiration" 
          defaultExpiration={this.props.defaultExpiration}
        />
        <FormSubmitButton disabled={!this.state.canSubmit}/>
      </Formsy.Form>
    );
  } 
});

var URLEntry = React.createClass({
  mixins: [Formsy.Mixin],
  getInitialState: function() {
    return {value: ''};
  },
  handleChange: function(event) {
    this.setState({value: event.target.value});
    this.setValue(event.currentTarget.value);
  },
  render: function() {
    var className = this.showRequired() ? 'required' : this.showError() ? 'error' : null;
    var errorMessage = this.getErrorMessage();
    return(
      <fieldset className="form-group ">
        <label for="target_url">Enter URL</label>
        <div className={className}>
          <input 
            required
            type="text"
            id="target_url" 
            className="form-control"
            ref="target_url" 
            placeholder={this.props.urlPlaceholder}
            onChange={this.handleChange}
          />
          <span>{errorMessage}</span>
        </div>
        <small className="text-muted">URL must be valid</small>
      </fieldset>
    )
  }
});

var RedirectsEntry = React.createClass({
  mixins: [Formsy.Mixin],
  getInitialState: function() {
    return({value: (this.props.defaultRedirects || 0)})
  },
  handleChange: function(event) {
    this.setState({value: event.currentTarget.value});
    this.setValue(event.currentTarget.value);
  },
  render: function() {
    var className = this.showRequired() ? 'required' : this.showError() ? 'error' : null;
    var errorMessage = this.getErrorMessage();
    return(
      <fieldset className="form-group">
        <label for="max_redirects">Maximum Redirects:</label>
        <div className={className}>
          <input
            type="text"
            id="max_redirects"
            className="form-control"
            ref="max_redirects"
            required
            value={this.state.value}
            onChange={this.handleChange}
          />
          <span>{errorMessage}</span>
        </div>
        <small className="text-muted">Enter '0' for no limit</small>
      </fieldset>
    )
  }
});

var ExpirationEntry = React.createClass({
  getInitialState: function() {
    return({
      inputValue: moment(this.props.defaultExpiration).format('MM/DD/YY hh:MM a') || '',
      value: this.props.defaultExpiration
    });
  },
  handleChange: function(newDate) {
    this.setState({value: newDate, inputValue: this.newDate})
  },
  render: function() {
    return(
      <fieldset className="form-group">
        <label for="expiration">Expiration date/time</label>
        <DateTimeField 
          minDate={moment()}
          onChange={this.handleChange}
          defaultText={this.state.inputValue}
          required
        />
        <small className="text-muted">Expires in 1 year if blank</small>
      </fieldset>
    )
  }
});

var FormSubmitButton = React.createClass({
  render: function() {
    return(
      <button className="btn btn-primary" type="submit" disabled={this.props.disabled}>Submit</button>
    )
  }
});

module.exports = LinkForm;
