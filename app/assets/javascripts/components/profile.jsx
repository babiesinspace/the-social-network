class Profile extends React.Component {
  constructor() {
    super()
    this.state = {
      friends: [],
      posts: [],
      user_info: []

    }
  }
  componentDidMount() {
    let path = window.location.pathname
    $.ajax({
      url: path+".json"
    })
    .done(response => {
      this.setState({friends: response[0].friends})
      this.setState({posts: response[0].posts})
      this.setState({user_info: response[0].user_info})
    }.bind(this))
  }
  render() {
    return(
      <div>
        <UserInfo info={this.state.user_info}/>
        <Friends friends={this.state.friends}/>
        <CreatePosts newPost={this.newPost}/>
        <Posts posts={this.state.posts}/>

      </div>

    )
  }
}
