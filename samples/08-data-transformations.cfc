component extends="../BaseTask" {

	function run() {
		print.line().boldWhiteOnYellowLine( "Press Ctrl-C to exit" ).line();
		print.blueLine( "Starting from: #getThreadname()#" ).toConsole();

		var future = asyncManager.newFuture( () => compute( 2 ) )
			// Use then like a map() operation and work on the results
			.then( (data) => {
				print.greenLine( "Computing from: #getThreadname()#" ).toConsole();
				print.line( "incoming: #data#" ).toConsole();
				print.line( "outgoing: #data * 2#" ).line().toConsole();
				return data * 2;
			} )
			.then( (data) => {
				print.greenLine( "Computing from: #getThreadname()#" ).toConsole();
				print.line( "incoming: #data#" ).toConsole();
				print.line( "outgoing: #data + 1#" ).line().toConsole();
				return data + 1;
			} )
			.then( (data) => {
				print.greenLine( "Computing from: #getThreadname()#" ).toConsole();
				print.boldGreenLine( "Final Result: " & data ).toConsole();
			} )
            //.thenRun( (data) => print.boldGreenLine( "Final Result: " & data ) )

        //print.blueLine( "Future Result: #future.get()#" )
		// Why did it blow up? Ahh remember the return statemetns

		while ( true ) {
			if ( !isNull( checkInterrupted() ) ) {
				return;
			}
			sleep( 100 );
		}
	}

}
