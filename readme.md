# ITB 2020 : To The Future With cbPromises

> by Luis Majano - Ortus Solutions

In this session we will explore the asynchronous and parallel programming constructs built into ColdBox 6. Java has supported a robust and functional approach to asynchronous programming since JDK8 and now it is available to us all in the Coldfusion (CFML) World! To the future!

* **Email**: lmajano@ortussolutions.com
* **Twitter**: [@lmajano](https://twitter.com/lmajano)
* **Site**: www.ortussolutions.com

## Agenda

* [] Lessons from Callbacks
  * [] Also refered to as Callback hell
  * [] Can make developers cry
  * [] Never ending nesting
  * [] Who has been there before?

* [] Movement to promises
  * [] To get some sanity back into to development
  * [] Can have different states:
    * Resolve : when completed
    * Reject : Error or something else
    * Pending : Not executing
  * [] Two channels of communication [Promises Track](samples\01-promises-track.md)
    * `Data`
    * `Error`

* [] What about ColdFusion?
  * [] `cfthread`, really?
    * [] This really makes developers cry :cry:
  * [] Nothing existed until ACF2018/Lucee 5.3 => `runAsync()`
  * [] Many Issues:
    * [] Backed by a custom wrapper to `java.util.concurrent.Future`
    * [] Simplistic error handler with no way to recover or continue executing pipelines after an exception. Concept of two tracks is broken
    * [] No way to choose or reuse the executor to run the sub-sequent `then()` operations.  Lucee actually creates a new `singleThreadExecutor()` for EVERY `then()` operation.
    * [] No way to operate on multiple futures at once
    * [] No way to combine/compose futures
    * [] Only works with closures, does not work on actually calling component methods

* [] What about Java?
  * [] JDK 8 Introduced `CompletableFutures`, `CompletionStages`, Executors, Lambdas.
  * [] Java Promises, but you know Java devs, over complicate things, even names! 
  * [] We have ported the majority of this functionality: `cbFutures`

* [] What is a ColdBox Future
  * [] Similar to JS Promises but in CF backed by `CompletableFuture`
  * [] Adapted for our dynamic language => many enhancements
  * [] `AsyncManager` class in charge of all async capabilities
    * [] Standalone: create an instance as a singleton
    * [] ColdBox: `async()` or `inject:AsyncManager@coldbox`
    * [] Functions:
      * [] Create Futures
      * [] Create/Manage Executors and Schedule Tasks
  * [] cbFutures Stages: [Stages Track](samples/02-java-stages.md)
  * [] [Create a future](samples/03-creating-future.cfc)
    * [] Where does it execute?
    * [] `ForkJoinPool`? What is it?
  * [] [Thread of execution](samples/04-nb-future.cfc)
  * [] [Changing the pool](samples/05-custom-pool.cfc)
    * [] Most powerful features of async programming
    * [] Register many different [~~types of executors/pools~~](samples/06-cached-pool.cfc)
      * [] Fixed
      * [] Single
      * [] Cached
      * [] Scheduled

* [] Magical Pipelining with `then()`!
  * [] Java API: `thenSupply()` + `thenAccept()`
  * [] CF API: `then()` (Easier + Dynamic API)
    * [] Curiosity: CompletableFutures never end!  This is So Ironic! Sharknado! :shark: