class Friend extends React.Component {
  render() {
    let friend = this.props.friend;
    return(
      <div>
        <div className="profile-page">
            <a href={`/profiles/${friend.id}`}>{friend.full_name}</a>
        </div>


      </div>
    )
  }
}
