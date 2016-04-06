var DisplayLink = React.createClass ({

  render: function() {
    return (
      <div>
        {this.props.link}
        <br/>
        <button onClick={this.props.resetApp}>Reset</button>
      </div>
    );
  } 
});
