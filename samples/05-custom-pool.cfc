component {

    asyncManager = new coldbox.system.async.AsyncManager();
    ioBound = asyncManager.newExecutor( name : "ioBound", threads: 10 );

	function compute(){
		sleep( 1000 );
		print.blueLine( "Computing from: #getThreadname()#" )
		return 2;
	}

	function create(){
		// Where is this executing now?
		return asyncManager.newFuture( () => compute(), ioBound )
	}

	function run() {

		print.blueLine( "Starting from: #getThreadname()#" )
		
		create().then( (data) => {
			// Where is this executing now?
			print.redLine( "Executing from: #getThreadname()#" )
			print.greenLine( data ) 
		} );

		sleep( 2000 );

	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
