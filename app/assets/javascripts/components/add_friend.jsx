class AddFriend extends React.Component {
  constructor() {
    super()
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(e) {
    e.preventDefault()
    let path = window.location.pathname
    $.ajax({
      url: path+'/friend_requests',
      method: 'post'
    })
    .done(function(r) {
      console.log(r)
    }.bind(this))
  }

  render() {

    return (
      <a href="" className="btn btn-primary" role="button" onClick={this.handleClick}>Add Friend</a>
    )
  }

}
