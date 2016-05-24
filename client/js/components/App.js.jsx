import React from 'react';
import moment from 'moment';
import ReactDOM from 'react-dom';
import DisplayLink from './DisplayLink';
import LinkForm from './LinkForm';

var App = React.createClass({
  getInitialState: function() {
    return {
      link: [],
      loading: false,
      submitted: false,
    }
  },
  resetApp() {
    this.setState({
      link: {},
      submitted: false
    });
  },
  addLink(link) {
    $.ajax({
      url: './links',
      type: 'POST',
      data: { 
        link: {
          target_url: link.target_url,
          max_redirects: link.max_redirects,
          expiration: link.expiration
        }
      },
      dataType: 'json',
      success: function(result) {
        this.setState({
          submitted: true,
          link: result
        });
      }.bind(this),
      error: function(result) {
        console.log(result)
        console.log(link)
      },
    })
  },
  render: function() {
    var targetComponent;
    var formProps = {

    }
    if (this.state.submitted) {
      targetComponent = <DisplayLink link={this.state.link} resetApp={this.resetApp} />;
    } else {
      targetComponent = <LinkForm 
        addLink={this.addLink}
        urlPlaceholder={"http://www.google.com"}
        redirectsPlaceholder={"100"}
        expirationPlaceholder={moment().add(1, 'y').valueOf()}
      />;
    }
    return (
      <div>
        {targetComponent}
      </div>
    )
  }
});

module.exports = App;
