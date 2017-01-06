class Friends extends React.Component {
  render() {
    return(
      <div>

        <div className="col-sm-4">
        <h4>Friends</h4>
          {this.props.friends.map((friend, i) =>
            <Friend friend={friend} key={i} />
          )}
        </div>

      </div>
    )
  }
}
