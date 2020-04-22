component {

    async = new coldbox.system.async.AsyncManager();

	function compute(){
		print.blueLine( "Executing from: #getThreadname()#" )
		return 2;
	}

	function create(){
		return async.newFuture( () => compute() )
	}

	function run() {
		create()
			.then( (data) => data * 2 )
			.then( (data) => data + 1 )
			.then( (data) => print.boldGreenLine( data ) );	
	}

	function getThreadname(){
		return createObject( "java", "java.lang.Thread" ).currentThread().getName();
	}

}
