component {

	function run() {
        // Create coldbox mapping
        fileSystemUtil.createMapping( "/coldbox", getCwd() & "coldbox" );
        fileSystemUtil.createMapping( "/testbox", getCwd() & "testbox" );
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
