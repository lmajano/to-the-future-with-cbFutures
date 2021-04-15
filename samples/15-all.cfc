component{

    asyncManager = new coldbox.system.async.AsyncManager();

    function getFeedData( feed ){
        print.redLine( ">> Thread: #getThreadName()# ");
        print.greenLine( "Getting feed: #arguments.feed#" ).toConsole()
        cffeed( action="read", source=feed, properties="local.properties", query="local.data" )
        print.greenLine( "* Finished feed: #arguments.feed#" ).toConsole()
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
            () => getFeedData( "https://feeds.transistor.fm/modernize-or-die-podcast-cfml-news-edition" ),
            () => getFeedData( "https://www.ortussolutions.com/blog/rss" ),
            () => getFeedData( "http://feeds.bbci.co.uk/news/world/rss.xml" )
        ];

        asyncManager
            .all( feeds )
            .get()
            .each( ( feed ) => {
                print.redLine( "Feed: #feed.title#" );
                feed.items.each( ( item ) => print.blueLine( "  + #item#" ).toConsole() )
            })
        
    }

}