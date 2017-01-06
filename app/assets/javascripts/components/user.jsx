class User extends React.Component {
  render() {
    let user = this.props.user;
    return(
            <div className="thumbnail">
              <img src={user.pic_url} alt=""/>
              <div className="caption">
                <h3>{user.full_name}</h3>
                <p><a href={"/profiles/"+user.id} className="btn btn-primary" role="button">Profile</a> <a href="#" className="btn btn-default" role="button">Add</a></p>
              </div>
            </div>
    )
  }
}

{/* <UserInfo url={user.id} /> */}
