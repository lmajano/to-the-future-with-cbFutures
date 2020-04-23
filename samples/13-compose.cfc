component{

    async = new coldbox.system.async.AsyncManager();

    function create( n ){
        return async.newFuture( () => n );
    }

    function run(){

		// If you do a computation that returns another future, instead of
		// returning a future, compose them
		create( 2 )
			// If not, the result is a future and not the actual result
			.thenCompose( (data) => create( data ) )
			.thenRun( (result) => print.greenLine( result ) )

    }

}