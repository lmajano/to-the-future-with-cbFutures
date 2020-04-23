component{

	async = new coldbox.system.async.AsyncManager();

	function process( future ){
		// Define a pipeline on an incoming future.
		arguments.future
			.then( (data) => data * 2 )
			.then( (data) => data + 1 );
	}

	function run(){
		var future = async.newEmptyFuture();
			
		// This will form the pipeline for us
		process( future );

		// We can manually complete it here
		future.complete( 2 )

		print.blueLine( "> completed: #future.get()#" );
	}

}