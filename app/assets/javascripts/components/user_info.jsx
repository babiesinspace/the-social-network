class UserInfo extends React.Component {
  render() {
    return(
    <div className="jumbotron">
      <img src={this.props.info.pic_url}/>
      <ul className="listprofile">
      <style> {"\
        .listprofile{\
          list-style-type:none; float: right; margin-right: 100px;\
        }\
        "}
      </style>
        <li>{this.props.info.full_name}</li>
        <li>{this.props.info.birthday}</li>
        <li>Hometown: {this.props.info.hometown}</li>
        <li>College: {this.props.info.education}</li>
        <li>{this.props.info.relationship_status}</li>
        <li>Current City: {this.props.info.current_city}</li>
      </ul>
    </div>
    )
  }
}
