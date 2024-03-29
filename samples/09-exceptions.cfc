component extends="../BaseTask" {

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
			.then( (data) => data * 2 )
			.then( (data) => data / 0 )
			.onException( (e) => {
				// e => Java Runtime Exception

				// All exceptions in Futures are wrapped in a `CompletionException`.
				// You can get the underlying exception by calling `getCause()`.
				if ( "java.util.concurrent.CompletionException" == e.getClass().getName() ) {
					e = e.getCause();
				}

				print.redLine( "Oops! Something blew up => " & e.getMessage() ).toConsole();
				print.redLine( "    Returning 1 instead." ).toConsole();
				return 1;
			} )
			.then( (data) => data / 0 )
			.handle( (data, e ) => {
				if( !isNull( e ) ){
					// All exceptions in Futures are wrapped in a `CompletionException`.
					// You can get the underlying exception by calling `getCause()`.
					if ( "java.util.concurrent.CompletionException" == e.getClass().getName() ) {
						e = e.getCause();
					}
					print.redLine( "Oops! Something blew up => " & e.getMessage() ).toConsole();
					print.redLine( "    Returning 0 instead." ).toConsole();
					return 0;
				}
				return data + 1;
			} )
			.then( (data) => data + 1 )
			.thenRun( (data) => print.boldGreenLine( "Final Result: " & data ).toConsole() )

		print.blueLine( "Future Result: #future.get()#" )

		// 1. Let's add a divide by zero error, let it blew up
		// 2. Add the onException() to handle the previous stages and recover
		// 3. What happens if not return value is returned?  blows up again, data is undefined.
		// 4. You can add as many onExceptions() as you see fit
		// 5. You can also use the handle() function
	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
