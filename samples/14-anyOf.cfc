component{

    asyncManager = new coldbox.system.async.AsyncManager();

    function dns1(){
        sleep( randRange( 200, 700 ) );
        return "1.1.1.1";
    }
    function dns2(){
        sleep( randRange( 200, 700 ) );
        return "8.8.8.8";
    }

    function getFeedData( feed ){
        print.greenLine( "Getting feed: #arguments.feed#" );
        cffeed( action="read", source=feed, properties="local.properties", query="local.data" );
        return {
            "title" : local.properties.title,
            "items" : local.data.reduce( ( result, row ) => {
                result.append( row.title )
                return result;
            }, [] )
        }
    }

    function run(){
        
        var feeds =  [
            () => getFeedData( "http://feeds.feedburner.com/raymondcamdensblog" ),
            () => getFeedData( "http://feeds.feedburner.com/ColdfusionbloggersorgFeed" ),
            () => getFeedData( "https://feeds.transistor.fm/modernize-or-die-podcast-cfml-news-edition" )
        ];

        var future = asyncManager.anyOf( feeds ).then( (winner) => {
            print.blueLine( "The winner is: #winner.title#" )
            winner.items.each( (item) => print.redLine( " > #item#" ) )
        } );
        
        //future.get()
        sleep( 4000 )
        print.blueLine( "Race is over!" );

        // 1. Using udf's for racing
        // 2. Using a feed runner with closures
        
    }

}