component extends="../BaseTask" {

    function run(){
        // var myPool = asyncManager.newExecutor( name : "myPool", threads: 10 );
		// var future = asyncManager.newFuture( executor: myPool )

        var future = asyncManager.newFuture()
            // runAsync( () => {}, myPool )
			.run( () => {
				for ( var i = 1; i <= 20; i++ ) {
					sleep( 500 );
					print.greenLine( "to infinity and beyond..." ).toConsole();
					if ( !isNull( checkInterrupted() ) ) {
						break;
					}
				}
				return -1;
			})
			// .orTimeout( 5, "seconds" ) // Completes exceptionally with a TimeoutException
			.completeOnTimeout( value : 50, timeout : 5000 )

		print.blueLine( "Finished! #future.get()#" ).toConsole();

        // mypool.shutdownNow();

		// 1. Show infinity!
		// 2. Timeout with an exception
		// 3. Timeout with a result
		// 4. Custom Pool as best practice for shutting down threads
    }

}
