component{

    async = new coldbox.system.async.AsyncManager();
    taskManager = async.newScheduledExecutor( name: "myTasks", threads: 20 );

    function run(){

        var future = taskManager.newSchedule( () => {
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