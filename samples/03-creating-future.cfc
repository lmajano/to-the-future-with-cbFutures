component {

	asyncManager = new coldbox.system.async.AsyncManager();

	function compute(){
		//sleep( 3000 )
		print.greenLine( "Computing from: #getThreadname()#" )
		return 2;
	}

	function run() {

		print.blueLine( "Starting from: #getThreadname()#" )
		
		var future = asyncManager.newFuture( () => compute() )
			.then( (data) => {
				// Where is this executing? same thread?
				// Think about it, we want a non-blocking mode.
				//print.redLine( "Executing from: #getThreadname()#" )
				print.greenLine( data )
				//return data;
			} );
		
		// Get the results and print: Remember, we are blocking here
		//print.blueLine( "Future: " & future.get() );
		//print.blueLine( "Future: " & future.get( timeout:1000 ) );
		//print.blueLine( "Future: " & future.get( timeout:1000, defaultValue: 5 ) );
		//print.blueLine( "Future: " & future.getNow( 20 ) );

		// 1. Why is the value empty?
		// 2. Add a return to the then(), if not, it evaluates to empty.
		// 3. Change to thenRun() to avoid these mistakes of returning data
		// 4. What happens if the computation is taking too long? and we add a timeout?
		// 5. But why a nasty exception, let use a default value now, woot woot!
		// 6. There is alos a getNow() which is get whatever you have NOW!

	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
