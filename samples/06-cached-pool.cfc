component extends="../BaseTask" {

	function init() {
		super.init();
		variables.cachedPool = asyncManager.newExecutor( name : "ioBound", type: "cached" );
	}

	function compute(){
		sleep( 1000 );
		print.blueLine( "Computing from: #getThreadname()#" ).toConsole();
		return 2;
	}

	function create(){
		// Where is this executing now?
		return asyncManager.newFuture( () => compute(), cachedPool )
	}

	function run() {

		print.blueLine( "Starting from: #getThreadname()#" ).toConsole();

		create().then( (data) => {
			// Where is this executing now?
			print.redLine( "Executing from: #getThreadname()#" ).toConsole();
			print.greenLine( data ).toConsole();
		} );

		sleep( 2000 );

	}

}
