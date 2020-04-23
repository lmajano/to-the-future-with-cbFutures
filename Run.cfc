component {

    async = new coldbox.system.async.AsyncManager();

	function compute(){
		print.blueLine( "Executing from: #getThreadname()#" )
		return 2;
	}

	function create(){
		return async.newFuture( () => compute() )
	}

	function handle( e ){
		print.redBoldLine( "ERROR: " );
		// Bounce back with an return
		return 100;
	}

	function run() {
		future = async.newFuture()
			.then( (data) => data * 2 )
			.then( (data) => data + 1 )
			.then( (data) => print.boldGreenLine( data ) )
			.onException( ( e ) => handle( e ) ) // you can put them anywhere you like
			;

		//future.complete( 2 );
		future.completeExceptionally( "error" );

		print.greenLine( "result: #future.get()#" );

	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
