component{

    asyncManager = new coldbox.system.async.AsyncManager();
    taskManager = asyncManager.newScheduledExecutor( name: "myTasks", threads: 20 );

    function run(){

        var future = taskManager
            .newTask( "my-task" )
            .call( () => {
                print.greenLine( "I am processing some data here..." ).toConsole()
                sleep( randRange( 200, 500 ) );
            } )
            .every( 1000 )
            .start();

        sleep( 10000 );
        future.cancel();

        print.redLine( "Done!" );

    }

}