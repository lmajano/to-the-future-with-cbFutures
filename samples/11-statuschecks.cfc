component{

	asyncManager = new coldbox.system.async.AsyncManager();
	threadPool = asyncManager.newExecutor( "myThreads" );

    function run(){

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
		
		//print.blueLine( "done? " & future.isDone() )
		//	.blueLine( "exception? " & future.isCompletedExceptionally() )
		//	.blueLine( "cancel? " & future.isCancelled() )
		//	.line()
		//	.toConsole();

		// print.greenLine( "Siesta time..." )
		// sleep( 1000 );

		// future.cancel( true );
		// print.blueLine( "done? " & future.isDone() )
		// 	.blueLine( "exception? " & future.isCompletedExceptionally() )
		// 	.blueLine( "cancel? " & future.isCancelled() )
		// 	.toConsole();
		
		//print.blueLine( "Finished! #future.get()#" );
		
		// Without this, sometimes you can have threads that never finish.
		threadPool.shutdownNow();
		
    }

}