import React from 'react';
import moment from 'moment';

var DisplayLink = React.createClass ({

  render: function() {
    var link = this.props.link.link
    var formattedExpiration = moment(link.expiration*1000).format('MMMM Do YYYY, hh:mm a')
    return (
      <div className="post-results">
        <p>Your brnr URL is: </p>
        <p>{link.url}</p>
        <p>This link redirects to {link.target_url}</p>
        <p>It will expire {formattedExpiration} (your local time)</p>
        <p>Or after {link.max_redirects} redirects</p>
        <button 
          className="btn btn-warning" 
          onClick={this.props.resetApp}>
          Reset
        </button>
      </div>
    );
  } 
});

module.exports = DisplayLink;
