component extends="../BaseTask" {

	function run() {

		print.blueLine( "Starting from: #getThreadname()#" ).toConsole();

		create( 40, 0 ).thenRun( (data) => {
			// Where is this executing? same thread?
			// Think about it, we want a non-blocking mode.
			print.redLine( "Executing from: #getThreadname()#" ).toConsole();
			print.redLine( data ).toConsole();
		} );

		sleep( 2000 );

	}

}
