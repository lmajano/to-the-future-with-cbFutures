component {

    async = new coldbox.system.async.AsyncManager();
    ioBound = async.newExecutor( name : "ioBound", type: "cached" );

	function compute(){
		print.greenLine( "Computing from: #getThreadname()#" )
		return 2;
	}

	function create(){
		// Where is this executing now?
		return async.newFuture( () => compute(), ioBound )
	}

	function run() {

		print.blueLine( "Starting from: #getThreadname()#" )
		
		create().then( (data) => {
			// Where is this executing now?
			print.redLine( "Executing from: #getThreadname()#" )
			print.greenLine( data )
		} )
		// The Future Pipeline!
		.then( (data) => print.greenLine( "All done: #data#" ) )
		.thenRun( (data) => print.greenLine( "not really" ) )
		.then( (data) => print.greenLine( "I never end!" ) );
		// Where is it going? NOWHERE!!!

	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
