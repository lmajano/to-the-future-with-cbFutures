component extends="../BaseTask" {

    function getFeedData( feed ){
        print.redLine( ">> Thread: #getThreadName()# ").toConsole();
        print.greenLine( "Getting feed: #arguments.feed#" ).toConsole()
        cffeed( action="read", source=feed, properties="local.properties", query="local.data" )
        print.greenLine( "* Finished feed: #arguments.feed#" ).toConsole();
        if ( isStruct( local.properties.title ) && local.properties.title.keyExists( "value" ) ) {
            local.properties.title = local.properties.title.value;
        }
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
            () => getFeedData( "https://feeds.transistor.fm/modernize-or-die-podcast-cfml-news-edition" ),
            () => getFeedData( "https://www.ortussolutions.com/blog/rss" ),
            () => getFeedData( "http://feeds.bbci.co.uk/news/world/rss.xml" )
        ];

        asyncManager
            .all( feeds )
            .get()
            .each( ( feed ) => {
                print.redLine( "Feed: #feed.title#" ).toConsole();
            } );
    }

}
