class Profile extends React.Component {
  constructor() {
    super()
    this.state = {
      friends: [],
      posts: [],
      user_info: []
    }
    this.displayResults = this.displayResults.bind(this)
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
  displayResults(response) {
    this.setState({
      friends: response
    })
  }

  render() {
    return(
        <div>
          <UserInfo info={this.state.user_info}/>
          <div>
            <h4>Search Friends:</h4>
            <SearchBar onSearch={this.displayResults} />
            <Friends friends={this.state.friends}/>
          </div>
          <CreatePosts newPost={this.newPost}/>
          <Posts posts={this.state.posts}/>
        </div>
    )
  }
}
