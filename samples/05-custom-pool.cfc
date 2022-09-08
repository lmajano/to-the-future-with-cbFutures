component extends="../BaseTask" {

	function init() {
		super.init();
		variables.ioBound = asyncManager.newExecutor( name : "ioBound", threads: 10 );
	}

    function create(){
		// Where is this executing now?
		return asyncManager.newFuture( () => compute( 40 ), ioBound )
	}

	function run() {

		print.blueLine( "Starting from: #getThreadname()#" )

		create().then( (data) => {
			// Where is this executing now?
			print.redLine( "Executing from: #getThreadname()#" )
			print.greenLine( data )
		} );

		sleep( 2000 );

	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
