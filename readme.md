# ITB 2020 : To The Future With `cbPromises` :rocket:

> by Luis Majano - Ortus Solutions

In this session we will explore the **asynchronous** and **parallel** programming constructs built into **ColdBox 6**. Java has supported a robust and functional approach to asynchronous programming since JDK8 and now it is available to us all in the Coldfusion (CFML) ⚡ World! To the future!

* 📧 **Email**: lmajano@ortussolutions.com
* 🐦**Twitter**: [@lmajano](https://twitter.com/lmajano)
* 🔗**Site**: www.ortussolutions.com
* 🔗**Code**: https://github.com/lmajano/to-the-future-with-cbFutures

## 📅 Agenda

* [] The NB (non-blocking) movement
  * [] Has made NodeJS shine, but other languages support this as well.
  * [] Movement to more async/parallel computations
  * [] Overall movement to computations

* [] Lessons from Callbacks
  * [] Also refered to as **Callback hell** :fire:
  * [] Can make developers cry :cry:
  * [] Never ending nesting :spider:
  * [] Who has been there before?  Don't lie!

* [] Movement to promises
  * [] JavaScript has made this very popular
  * [] To get some sanity back into to development
  * [] Can have different states:
    * `Resolve` : when completed
    * `Reject` : Error or something else
    * `Pending` : Not executing just yet
  * [] Cancel them
  * [] Two channels of communication [Promises Track](samples\01-promises-track.md)
    * `Data`
    * `Error`

* [] What about ColdFusion?
  * [] `cfthread`, really?
    * [] This really makes developers cry :cry:
    * [] Easy, but plagued with issues:
      * [] No way to choose where it runs
      * [] No concept of returning data, it's up to you
      * [] Hard to manage them (cancel, monitor, pause)
      * [] No functional approaches
  * [] Nothing existed until ACF2018/Lucee 5.3 => `runAsync()`
  * [] Many Issues:
    * [] Backed by a custom wrapper to `java.util.concurrent.Future`
    * [] Simplistic error handler with no way to recover or continue executing pipelines after an exception. Concept of two tracks is broken
    * [] No way to choose or reuse the executor to run the sub-sequent `then()` operations.  Lucee actually creates a new `singleThreadExecutor()` for EVERY `then()` operation.
    * [] No way to operate on multiple futures at once
    * [] No way to combine/compose futures
    * [] Only works with closures, does not work on actually calling component methods

* [] What about Java?
  * [] JDK 8 Introduced `CompletableFutures`, `CompletionStages`, Executors, Lambdas and much more.
  * [] Java CompletableFutures are like JavaScript Promises, but you know Java devs, over complicate things, even names!
  * [] We have ported the majority of this functionality to CFML: `cbFutures`

* [] What is a ColdBox Future
  * [] Similar to JavaSscript Promises but in CF backed by `CompletableFuture`
  * [] Adapted for our dynamic language => many enhancements
  * [] `AsyncManager` class in charge of all async capabilities
    * [] Standalone: create an instance as a singleton
    * [] ColdBox: `async()` or `inject:AsyncManager@coldbox`
    * [] Functions:
      * [] Create Futures
      * [] Create/Manage Executors and Schedule Tasks
  * [] [cbFutures Stages](samples/02-cbfutures-stages.md)
  * [] [Create a future](samples/03-creating-future.cfc)
  * [] [Thread of execution](samples/04-nb-future.cfc)
  * [] [Changing the pool](samples/05-custom-pool.cfc)
    * [] Register many different [types of executors/pool](samples/06-cached-pool.cfc)
      * [] `Fixed` : Control the amount of threads, cpu intensive, io intensive
      * [] `Single` : A processing queue FIFO
      * [] `Cached` : Ever expanding demand queue
      * [] `Scheduled` : Scheduled Tasks

* [] 🎩 Magical Pipelines: [`then()`!](samples/07-then.cfc)
  * [] Java API: `thenApply()`, `thenAccept()`, `thenRun()`, why?
  * [] CF API: `then()` (Easier + Dynamic API)
    * [] Curiosity: CompletableFutures never end!  This is So Ironic! Sharknado! :shark:
  * [Data Transformations](samples/08-data-transformations.cfc)
  * [Dealing with Exceptions](samples/09-exceptions.cfc)
  * [Adding Timeouts](samples/10-timeouts.cfc)
    * Success on timeout
    * Exception on timeout
  * [Checking status](samples/11-statuschecks.cfc)
* [Racing Futures](samples/12-anyOf.cfc)
* [All Futures](samples/13-all.cfc)
* [All futures Modified](samples/14-allapply.cfc)