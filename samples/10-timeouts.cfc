component{

    async = new coldbox.system.async.AsyncManager();

    function run(){
		var future = async.newFuture()
			.run( () => {
				while( true ){
					sleep( 500 );
					print.greenLine( "to infinity and beyond..." ).toConsole();
				}
				return -1;
			})
			//.completeOnTimeout( 50, 5, "seconds" )
			//.orTimeout( 5, "seconds" )

		print.blueLine( "Finished! #future.get()#" );

		// 1. Show infinity!
		// 2. Timeout with an exception
		// 3. Timeout with a result
		// 4. Custom Pool as best practice for shutting down threads
    }

}