var App = React.createClass({
  getInitialState: function() {
    return {
      link: 'no link',
      loading: false,
      submitted: false,
    }
  },

  resetApp() {
    this.setState({
      link: null,
      submitted: false
    });
  },

  addLink(link) {
    $.ajax({
      url: './links',
      type: 'POST',
      data: { 
        link: {
          target_url: link.target_url
        }
      },
      dataType: 'json',
      success: function(data) {
        this.setState({
          submitted: true,
          link: data.url_string
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
