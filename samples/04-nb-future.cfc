component {

	asyncManager = new coldbox.system.async.AsyncManager();

	function compute(){
		//sleep( 1000 );
		print.greenLine( "Computing from: #getThreadname()#" )
		return 2;
	}

	function create(){
		return asyncManager.newFuture( () => compute() )
	}

	function run() {

		print.blueLine( "Starting from: #getThreadname()#" )
		
		create().thenRun( (data) => {
			// Where is this executing? same thread?
			// Think about it, we want a non-blocking mode.
			print.redLine( "Executing from: #getThreadname()#" )
			print.redLine( data ) 
		} );

		sleep( 2000 );

	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
