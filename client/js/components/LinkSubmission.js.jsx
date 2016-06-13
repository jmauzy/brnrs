import React from 'react';
import URLField from './UrlField';
import ExpirationFields from './ExpirationFields';
import Confirmation from './Confirmation';
import Results from './Results';

let fieldValues = {
  target_url: null,
  max_redirects: null,
  expiration: null,
}

export default class LinkSubmission extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      step: 1,
      result: null
    };
    this.nextStep = this.nextStep.bind(this);
    this.previousStep = this.previousStep.bind(this);
    this.submit = this.submit.bind(this);
    this.resetSubmission = this.resetSubmission.bind(this);
  }

  saveValues(fields) {
    fieldValues = Object.assign({}, fieldValues, fields);
  }

  nextStep() {
    this.setState({step : this.state.step + 1});
  }

  previousStep() {
    this.setState({step : this.state.step -1});
  }

  submit() {
    const xhr = new XMLHttpRequest();
    let data = JSON.stringify({ 
      link: {
        target_url: fieldValues.target_url,
        max_redirects: fieldValues.max_redirects,
        expiration: fieldValues.expiration
      }
    });

    xhr.open('POST', encodeURI('./links'));
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
      if (xhr.status === 200) {
        this.setState({
          step: 4,
          link: JSON.parse(xhr.responseText)
        });
      }
      else {
        this.setState({
          step: 1
        });
        alert('Something went wrong, please try again');
      };
    }.bind(this);

    xhr.send(data);
  }

  resetSubmission() {
    this.setState({
      step : 1,
      fieldValues: {
        target_url: null,
        expiration: null,
        max_redirects: null
      }
    });
  }

  render() {
    switch (this.state.step) {
      case 1:
        return (
          <URLField 
            saveValues = {this.saveValues}
            nextStep = {this.nextStep} />
        );
      case 2:
        return (
          <ExpirationFields 
            saveValues = {this.saveValues}
            nextStep = {this.nextStep}
            previousStep = {this.previousStep} />
        );
      case 3:
        return (
          <Confirmation 
            target_url = {fieldValues.target_url}
            expiration = {fieldValues.expiration}
            max_redirects = {fieldValues.max_redirects}
            previousStep = {this.previousStep}
            submit = {this.submit}/>
        );
      case 4:
        return (
          <Results 
            link = {this.state.link.link}
            resetSubmission = {this.resetSubmission}/> 
        )
    }
  }
}

