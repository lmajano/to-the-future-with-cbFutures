component{

    asyncManager = new coldbox.system.async.AsyncManager();

    function create( n ){
        return asyncManager.newFuture( () => n );
    }

    function run(){

		// Let's combine two async operations and when both arrive continue operation
		create( 2 )
			.thenCombine( create(3), (a,b) => a+b )
			.thenRun( (result) => print.greenLine( result ) )


    }

}