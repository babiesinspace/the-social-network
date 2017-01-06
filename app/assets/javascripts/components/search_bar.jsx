class SearchBar extends React.Component {

  handleSubmit(event) {
    event.preventDefault();
    let searchBox = this.refs.searchBox
    $.ajax({
      url: '/search',
      method: 'get',
      data: {query: searchBox.value}
    })
  }

  render() {

    return(
      <div className="search-box">
        <form id="search-form" onSubmit={this.handleSubmit.bind(this)} >
          <input id="search" type="text" name="query" ref="searchBox"/>
        </form>
        <i className="fa fa-search"></i>
      </div>

    )
  }
}
