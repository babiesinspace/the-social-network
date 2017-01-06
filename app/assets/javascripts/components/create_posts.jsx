class CreatePosts extends React.Component {
  constructor() {
    super();
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  handleSubmit(event) {
    event.preventDefault();
    let postBody = this.refs.PostBody.value
    let path = window.location.pathname
    console.log(path)
    console.log(postBody)
    $.ajax({
      url: path+'/posts',
      method: 'post',
      data: {
        post: {
          body: postBody
        }
      }
      })
      .done(function(response){
        console.log(response)
      }.bind(this))
  }
  render() {
    let post = this.props.post;
    return(
      <div>
      <section id="new-post-box">
        <p id="new-post-title">Write a post</p>
        <form id="post-form" onSubmit={this.handleSubmit}>
          <textarea id="new-post" cols="30" rows="5" maxLength="140" name="post" ref="PostBody"></textarea>
          <input type="submit" value="Post"/>
        </form>
      </section>

      </div>
    )
  }

}
