component {

    asyncManager = new coldbox.system.async.AsyncManager();
    ioBound = asyncManager.newExecutor( name : "ioBound", type: "cached" );

	function compute(){
		print.greenLine( "Computing from: #getThreadname()#" )
		return 2;
	}

	function create(){
		// Where is this executing now?
		return asyncManager.newFuture( () => compute(), ioBound )
	}

	function run() {

		print.blueLine( "Starting from: #getThreadname()#" ).line();
		
		create().then( (data) => {
			// Where is this executing now?
			print.redLine( "Executing from: #getThreadname()#" )
			print.greenLine( data )
			//return data;
		} )
		// The Future Pipeline!
		.thenRun( (data) => print.redLine( "Hello from runnable land!" ).toConsole() )
		.then( (data) => print.greenLine( "All done: #data#" ).toConsole() )
		.then( (data) => print.greenLine( "not really" ).toConsole() );
		// Where is it going? NOWHERE!!!

		print.line( "Waiting for results..." ).toConsole()
		sleep( 2000 );
	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
