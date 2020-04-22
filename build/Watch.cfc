component {

	function run() {
        command( "clear" ).run();
        watch()
            .paths( "Run.cfc" )
            .withDelay( 500 )
            .onChange( () => command( 'cls && task run run' ).run() )
            .start();
	}

}
