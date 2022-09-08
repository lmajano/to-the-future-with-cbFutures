component extends="../BaseTask" {

    function init() {
        super.init();
        loadModule( shell.pwd() & "modules/mockdatacfc" );
        variables.mock = getInstance( "MockData@mockdatacfc" );
    }

    function getObject(){
        return {
            "getMemento" = () => {
                return mock.mock(
                    "$returnType" : "struct",
                    "name" : "name",
                    "age" : "age",
                    "id" : "uuid"
                );
            }
        };
    }

    function run(){

        // Build objects async
        var aObjects = asyncManager.allApply(
            [].append( asyncManager.arrayRange( "1..200" ), true ),
            (item) => getObject()
        );

        // Process them
        asyncManager.allApply( aObjects, ( item ) => item.getMemento() )
            // .thenRun( ( result ) => print.line( "does this work?" ).toConsole() )
            // .allApply( data, ( item ) => item.getMemento(), asyncManager.$executors.newFixedThreadPool( 50 ) )
            .each( (item) => print.blueLine( item.toString() ).toConsole() )


        // 1. Now let's use a custom executor

    }

}
