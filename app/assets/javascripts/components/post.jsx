class Post extends React.Component {
  render() {
    let post = this.props.post;
    return(
      <div>
        <ul>
          <li>{post.body}</li>
          <br/>
          <p>By: <a href={`/profiles/${post.author_id}`}>{post.author_name}</a></p>
          <br/>
        </ul>
      </div>
    )
  }
}
