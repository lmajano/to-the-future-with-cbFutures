component {

    function init() {
        fileSystemUtil.createMapping( "/coldbox", getCwd() & "coldbox" );
        fileSystemUtil.createMapping( "/testbox", getCwd() & "testbox" );
        variables.asyncManager = new coldbox.system.async.AsyncManager();
    }

    function getThreadname() {
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

    public Future function create( required any value, numeric timeout = randRange( 200, 1000 ) ) {
        return asyncManager.newFuture( () => {
            return compute( value ?: nullValue(), timeout );
        } );
    }

    public any function compute( required any value, numeric timeout = 0 ) {
        print.greenLine( "Computing from: #getThreadname()#" ).toConsole();
        sleep( arguments.timeout );
        return arguments.value ?: nullValue();
    }

}
