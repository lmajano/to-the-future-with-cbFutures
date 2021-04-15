component {

    asyncManager = new coldbox.system.async.AsyncManager();

	function compute(){
		print.greenLine( "Computing from: #getThreadname()#" )
		return 2;
	}

	function create(){
		return asyncManager.newFuture( () => compute() )
	}

	function run() {
		print.blueLine( "Starting from: #getThreadname()#" )
		
		var future = create()
			// Use then like a map() operation and work on the results
			.then( (data) => data * 2 )
			.then( (data) => data + 1 )
			.then( (data) => print.boldGreenLine( "Final Result: " & data ) )
			//.thenRun( (data) => print.boldGreenLine( "Final Result: " & data ) )
			
		//print.blueLine( "Future Result: #future.get()#" )
		// Why did it blow up? Ahh remember the return statemetns

	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
