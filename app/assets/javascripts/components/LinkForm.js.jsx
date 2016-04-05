var LinkForm = React.createClass({

  createLink(event) {
    event.preventDefault();
    var link = { 
      target_url: this.refs.target_url.value 
    }
    this.props.addLink(link);
  },

  render: function() {
    return(
      <form className="link-form" onSubmit={this.createLink}>
        <input type="text" ref="target_url" placeholder="Enter URL"/>
        <button type="submit">Submit</button>
      </form>
    );
  } 
});
