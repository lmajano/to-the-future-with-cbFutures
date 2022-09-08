component extends="../BaseTask" {

	function init() {
		variables.threadPool = asyncManager.newExecutor( "myThreads" );
	}

    function run() {
		var future = asyncManager.newFuture(
				() => {
					while( true ){
						sleep( 500 );
						print.greenLine( "to infinity and beyond..." ).toConsole();
					}
					return -1;
				}, threadPool
			)
			.completeOnTimeout( 0, 5000 );

		print.greenLine( "Siesta time..." )
		sleep( 2000 );

		// print.blueLine( "done? " & future.isDone() )
		// 	.blueLine( "exception? " & future.isCompletedExceptionally() )
		// 	.blueLine( "cancel? " & future.isCancelled() )
		// 	.line()
		// 	.toConsole();

		// print.greenLine( "Siesta time..." )
		// sleep( 1000 );

		// future.cancel( true );

		// print.blueLine( "done? " & future.isDone() )
		// 	.blueLine( "exception? " & future.isCompletedExceptionally() )
		// 	.blueLine( "cancel? " & future.isCancelled() )
		// 	.line()
		// 	.toConsole();

		// if ( future.isDone() && !future.isCompletedExceptionally() && !future.isCancelled() ) {
		// 	print.blueLine( "Finished! #future.get()#" ).line();
		// }

		// Without this, sometimes you can have threads that never finish.
		print.line( "Shutting down the thread pool" ).toConsole();
		threadPool.shutdownNow();
		print.line( "Thread pool shut down" ).toConsole();

    }

}
