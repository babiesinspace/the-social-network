class Timeline extends React.Component {
  constructor() {
    super()
    this.state = {
      users: []
    }
  }
  componentDidMount() {
    $.ajax({
      url: '/profiles.json',
      method: 'get'
    })
    .done(response => {
      this.setState({users: response})
    }.bind(this))
  }
  render() {
    return(
      <div>
        <h1>Welcome</h1>
        <div className="row">
          <div className="col-sm-8 col-md-4">
           {this.state.users.map( (user, i) =>
             <User user={user} key={i}/>
           )}

         </div>
       </div>
    </div>
    )
  }
}
