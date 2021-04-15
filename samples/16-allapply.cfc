component{

    asyncManager = new coldbox.system.async.AsyncManager();
    mock = new testbox.system.modules.mockdatacfc.models.MockData();

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
        asyncManager
            .allApply( aObjects, ( item ) => item.getMemento() )
            //.allApply( data, ( item ) => item.getMemento(), asyncManager.$executors.newFixedThreadPool( 50 ) )
            .each( (item) => print.blueLine( item.toString() ) );


        // 1. Now let's use a custom executor
        
    }

}