component {

	async = new coldbox.system.async.AsyncManager();

	function compute(){
		sleep( 1000 );
		print.blueLine( "Executing from: #getThreadname()#" )
		return 2;
	}

	function create(){
		return async.newFuture( () => compute() )
	}

	function run() {

		print.blueLine( "Starting from: #getThreadname()#" )
		
		create().then( (data) => {
			// Where is this executing? same thread?
			// Think about it, we want a non-blocking mode.
			print.redLine( "Executing from: #getThreadname()#" )
			print.greenLine( data ) 
		} );

		sleep( 2000 );

	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
