component {

	function run() {
        // Start the watcher
        command( "clear" ).run();
        watch()
            .paths( "Run.cfc" )
            .withDelay( 500 )
            .onChange( () => {
                command( 'echo Running Task...' ).run()
                command( 'task run run' ).run()
            } )
            .start();
	}

}
