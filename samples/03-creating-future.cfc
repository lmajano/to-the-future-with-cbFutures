component {

	async = new coldbox.system.async.AsyncManager();

	function compute(){
		print.blueLine( "Executing from: #getThreadname()#" )
		return 2;
	}

	function run() {

		print.blueLine( "Starting from: #getThreadname()#" )
		
		async.newFuture( () => compute() )
			.then( (data) => {
				// Where is this executing? same thread?
				// Think about it, we want a non-blocking mode.
				//print.redLine( "Executing from: #getThreadname()#" )
				print.greenLine( data ) 
			} );

	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
