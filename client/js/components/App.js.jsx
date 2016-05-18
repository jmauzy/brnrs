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
        }
      },
      dataType: 'json',
      success: function(result) {
        this.setState({
          submitted: true,
          link: result
        });
      }.bind(this),
    })
  },

  render: function() {
    var targetComponent;
    if (this.state.submitted) {
      targetComponent = <DisplayLink link={this.state.link} resetApp={this.resetApp} />;
    } else {
      targetComponent = <LinkForm addLink={this.addLink} />;
    }
    return (
      <div>
        {targetComponent}
      </div>
    )
  }
});
