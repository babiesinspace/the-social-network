class Posts extends React.Component {
  render() {
    return(
      <div>
        <div>

          <div className="col-sm-4">
          <h4>Posts</h4>
            {this.props.posts.map((post, i) =>
              <Post post={post} key={i} />
            )}
          </div>
        </div>
        <style> {"\
          .col-sm-4{\
            margin-left: 100px;\
          }\
          "}
        </style>
      </div>
    )
  }
}
