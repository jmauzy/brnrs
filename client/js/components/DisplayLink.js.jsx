import React from 'react';
import moment from 'moment';

var DisplayLink = React.createClass ({

  render: function() {
    var link = this.props.link
    var formattedExpiration = moment(link.expiration*1000).format('MMMM do YYYY, hh:mm a')
    return (
      <div>
        <p>Your SecLink URL is localhost:3000/{link.url_string}</p>
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
