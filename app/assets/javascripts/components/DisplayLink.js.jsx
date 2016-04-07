var DisplayLink = React.createClass ({

  render: function() {
    return (
      <div>
        {this.props.link}
        <br/>
        <button className="btn btn-warning" onClick={this.props.resetApp}>Reset</button>
      </div>
    );
  } 
});
