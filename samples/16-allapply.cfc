component{

    async = new coldbox.system.async.AsyncManager();
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
        var aObjects = async
            .allApply( async.arrayRange( 1, 200 ), (item) => getObject() )
        
        // Process them
        async
            .allApply( aObjects, ( item ) => item.getMemento() )
            //.allApply( data, ( item ) => item.getMemento(), async.$executors.newFixedThreadPool( 50 ) )
                .each( (item) => print.blueLine( item.toString() ) );


        // 1. Now let's use a custom executor
        
    }

}