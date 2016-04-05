var App = React.createClass({
  addLink(link) {
    $.ajax({
      url: './links',
      type: 'POST',
      data: { 
        link: {
          target_url: link.target_url
        }
      },
      success: function(data) {
        alert(data);
      }
    })
  },

  render: function() {
    return (
      <div>
        <LinkForm addLink={this.addLink}/>
      </div>
    );
  }
});
