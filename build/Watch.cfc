component {

	function run() {
        // Create coldbox mapping
        fileSystemUtil.createMapping( "/coldbox", getCwd() & "coldbox" );
        // Start the watcher
        command( "clear" ).run();
        watch()
            .paths( "Run.cfc" )
            .withDelay( 500 )
            .onChange( () => command( 'cls && task run run' ).run() )
            .start();
	}

}
