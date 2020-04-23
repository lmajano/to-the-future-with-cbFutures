component{

	async = new coldbox.system.async.AsyncManager();
	threadPool = async.newExecutor( "myThreads" );

    function run(){

		var future = async.newFuture(
				() => {
					while( true ){
						sleep( 500 );
						print.greenLine( "to infinity and beyond..." ).toConsole();
					}
					return -1;
				}, threadPool
			)
			.completeOnTimeout( 0, 5000 );
		
		print.blueLine( "done? " & future.isDone() )
			.blueLine( "exception? " & future.isCompletedExceptionally() )
			.blueLine( "cancel? " & future.isCancelled() )
			.line()
			.toConsole();

		//future.cancel();
		//print.blueLine( "done? " & future.isDone() )
		//	.blueLine( "exception? " & future.isCompletedExceptionally() )
		//	.blueLine( "cancel? " & future.isCancelled() )
		//	.toConsole();
		
		print.blueLine( "Finished! #future.get()#" );
		
		// Without this, sometimes you can have threads that never finish.
		//threadPool.shutdownNow();
		
    }

}