class IndexParent extends React.Component {
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

  render(){

    return(
      <section>
        <div>
          <SearchBar/>
        </div>
        <div>
          <Timeline users={this.state.users}/>
        </div>
      </section>
    )
  }
}
