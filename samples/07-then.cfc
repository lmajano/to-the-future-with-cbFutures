component extends="../BaseTask" {

	function run() {
		print.blueLine( "Starting from: #getThreadname()#" ).line();
		asyncManager.newFuture( () => compute( 2 ) )
			.then( (data) => {
				// Where is this executing now?
				print.redLine( "Executing from: #getThreadname()#" )
				print.greenLine( data )
				return data;
			} )
			// The Future Pipeline!
			.thenRun( (data) => {
				print.redLine( "Hello from runnable land! #data#" ).toConsole();
			} )
			.then( (data) => print.greenLine( "All done: #data#" ).toConsole() )
			.then( (data) => print.greenLine( "not really" ).toConsole() );
			// Where is it going? NOWHERE!!!

		print.line( "Waiting for results..." ).toConsole()
		sleep( 2000 );
	}

}
