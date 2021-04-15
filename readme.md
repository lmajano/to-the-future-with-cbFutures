# To The Future With `cbFutures` 🚀

> by Luis Majano - Ortus Solutions

In this session we will explore the **asynchronous** and **parallel** programming constructs built into **ColdBox 6**. Java has supported a robust and functional approach to asynchronous programming since JDK8 and now it is available to us all in the Coldfusion (CFML) ⚡ World! To the future!

* 📧 **Email**: lmajano@ortussolutions.com
* 🐦 **Twitter**: [@lmajano](https://twitter.com/lmajano) [@ortussolutions](https://twitter.com/ortussolutions)
* 🔗 **Site**: www.ortussolutions.com
* 🔗 **Code**: https://github.com/lmajano/to-the-future-with-cbFutures

## 📅 Agenda

* [√] The NB (non-blocking) movement
  * [] Has made NodeJS shine, but other languages support this as well.
  * [] Movement to more async/parallel computations
  * [] Overall movement to computations

* [√] Lessons from Callbacks
  * [] Also refered to as **Callback hell** 🔥
  * [] Can make developers cry 😢
  * [] Never ending nesting collection of closures/functions 🕷️
  * [] Who has been there before?  Don't lie! 🤥

* [√] Movement to **promises**
  * [] JavaScript has made this very popular
  * [] To get some sanity back into to development from call back hellfire 🔥
  * [] Can have 3 different states:
    * `Resolve` : When completed
    * `Reject`  : Error or something else
    * `Pending` : Not executing just yet
  * [] Cancel and Resolve them programmatically
  * [] Two channels of communication [Promises Track](samples/01-promises-track.md)
    * `Data`
    * `Error`

* [√] What about ColdFusion?
  * [] `cfthread`, right?? right? 🔨
    * [] Great for **very** basic threading
    * [] Easy, but plagued with issues, which makes developers ALSO cry :😢
      * [] No way to choose where it runs (thread pool)
      * [] No concept of returning data, it's up to you to monitor/track data
      * [] Hard to manage them (cancel, monitor, pause)
      * [] No functional approaches
      * [] Managing multiple threads and joining can be cumbersome and horrible
  * [] Nothing existed until ACF2018/Lucee 5.3 => `runAsync()`
    * [] A step up, but not a big step
    * [] Still Many Issues:
      * [] Backed by a custom wrapper to `java.util.concurrent.Future`
      * [] Simplistic error handler with no way to recover or continue executing pipelines after an exception. Concept of two tracks is broken!
      * [] No way to choose or reuse the executor to run the sub-sequent `then()` operations.  Lucee actually creates a new `singleThreadExecutor()` for EVERY `then()` operation.
      * [] No way to operate on multiple futures at once
      * [] No way to combine/compose futures
      * [] Only works with closures, does not work on actually calling component methods
  * [] 🤢 We have two approaches to threading which are extremely simplistic and not powerful at all.

* [√] What about Java?
  * [] JDK 8 Introduced `CompletableFutures`, `CompletionStages`, Executors, Lambdas and much more.
  * [] 🦄 Java `CompletableFutures` are like JavaScript Promises, but you know Java devs, over complicate things, even names!
  * [] We have ported the majority of this functionality to CFML: `ColdBox Futures`
    * ColdBox, WireBox, CacheBox and LogBox

* [√] What is a ColdBox Future?
  * [√] Similar to JavaScript Promises but in CF backed by `CompletableFuture` Java API
  * [√] Adapted for our dynamic language => many enhancements
  * [√] `AsyncManager` class in charge of all async capabilities
    * [] Standalone: create an instance as a singleton
    * [] ColdBox: `async()` or `inject:AsyncManager@coldbox`
    * [] Functions:
      * [] Create Futures
      * [] Create/Manage Executors
      * [] Create/Manage Schedule Tasks
  * [√] [cbFutures Stages](samples/02-cbfutures-stages.md)
  * [√] [Create a future](samples/03-creating-future.cfc)
  * [√] [Thread of execution](samples/04-nb-future.cfc)
  * [√] [Changing the pool](samples/05-custom-pool.cfc)
    * [√] Register many different [types of executors/pool](samples/06-cached-pool.cfc)
      * [] `Fixed` : Control the amount of threads, cpu intensive, io intensive
      * [] `Single` : A processing queue FIFO
      * [] `Cached` : Ever expanding demand queue
      * [] `Scheduled` : Scheduled Tasks

* [] 🎩 [Magical Pipelines](samples/07-then.cfc)
  * [] Java API: `thenApply()`, `thenAccept()`, `thenRun()`, why?
  * [] CF API: `then()` and `thenRun()` (Easier + Dynamic API)
    * [] Curiosity: CompletableFutures never end!  This is So Ironic! Sharknado! :shark:
  * [Data Transformations](samples/08-data-transformations.cfc)
  * [Dealing with Exceptions](samples/09-exceptions.cfc)
  * [Dealing with Timeouts](samples/10-timeouts.cfc)
    * Success on timeout
    * Exception on timeout
  * [Checking status](samples/11-statuschecks.cfc)
  * [Combining Futures](samples/12-combine.cfc)
    * Very much like a `reduce()` operation
    * Remember this: 1-1 operation
  * [Composing Futures](samples/13-compose.cfc)
    * Monadic design pattern (https://medium.com/thg-tech-blog/monad-design-**pattern**-in-java-3391d4095b3f)
    * Hmm: 2-1 Operation, future of futures!
  
* [] Working with multiple futures
  * [Racing Futures](samples/14-anyOf.cfc)
  * [All Futures](samples/15-all.cfc)
  * [All futures Modified](samples/16-allapply.cfc)

* [] Extra Credit: Schedule Tasks!
