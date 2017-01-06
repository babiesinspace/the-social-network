class IndexParent extends React.Component {
  constructor() {
    super()
    this.state = {
      users: []
    }
    this.displayResults = this.displayResults.bind(this)
  }
  componentDidMount() {
    $.ajax({
      url: '/profiles.json',
      method: 'get'
    })
    .done(response => {
      this.setState({
        users: response
      })
    }.bind(this))
  }

  displayResults(response) {
    this.setState({
      users: response
    })
  }

  render(){

    return(
      <section>
        <div>
          <SearchBar onSearch={this.displayResults} />
        </div>
        <div>
          <Timeline users={this.state.users}/>
        </div>
      </section>
    )
  }
}
