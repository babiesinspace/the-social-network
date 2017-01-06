class Friends extends React.Component {
  render() {
    return(
        <div>

        <h4>Friends</h4>
          {this.props.friends.map((friend, i) =>
            <Friend friend={friend} key={i} />
          )}
        </div>
    )
  }
}
