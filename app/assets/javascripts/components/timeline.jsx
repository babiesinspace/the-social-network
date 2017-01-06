class Timeline extends React.Component {


  render() {
    return(
     <div className="row">
       <div className="col-sm-8 col-md-4">

         {this.props.users.map( (user) =>
           <User user={user} key={user.id} id={user.id}/>
         )}
         </div>
       </div>
    </div>
    )
  }
}
