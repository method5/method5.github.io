---
layout: post
title: Avoiding Oracle Quines
---

Unexpected quines can appear when querying tables like `V$SQL`.  To avoid them you must sometimes add an extra predicate to those queries:

{% highlight sql %}

	select *
	from v$sql
	where ...
		and sql_fulltext not like '%quine%';

{% endhighlight %}


What is a Quine?
----------------

A quine is a program that outputs its own source code.  Normally it's a form of code golf; a challenging, impractical puzzle to entertain programmers.  They're usually hard to create and look cryptic.

Here's a Python 2 example.

{% highlight python %}

	_='_=%r;print _%%_';print _%_

{% endhighlight %}

See [this Wikipedia article](https://en.wikipedia.org/wiki/Quine_(computing)) or [this Code Golf question](https://codegolf.stackexchange.com/questions/69/golf-you-a-quine-for-great-good) for more details and examples of quines.


How Do They Happen?
-------------------

Quines can happen when querying `V$SQL`, because the query will match its own conditions.  For example, this query searches for all recent SQL statements that reference the table "FOO":

{% highlight SQL %}

	SQL> select * from foo;

	no rows selected

	SQL> select sql_id, sql_text from v$sql where lower(sql_fulltext) like '%foo%';

	SQL_ID        SQL_TEXT
	------------- --------------------------------------------------------------------------------
	83zk38bvaq4nu select * from foo
	2zadv09qpyc9a select sql_id, sql_text from v$sql where lower(sql_fulltext) like '%foo%'

	2 rows selected.

{% endhighlight %}

Before the query against V$SQL was run, it was parsed and put in V$SQL, which is why it found itself.  These recursive problems are weird and take a while to get used to.


How Do We Stop Them?
--------------------

Stopping the quines is easy.  Simply add another predicate that will exclude itself:

{% highlight SQL %}

	SQL> alter system flush shared_pool;

	System altered.

	SQL> select * from foo;

	no rows selected

	SQL> select sql_id, sql_text from v$sql where lower(sql_fulltext) like '%foo%' and sql_fulltext not like '%quine%';

	SQL_ID        SQL_TEXT
	------------- --------------------------------------------------------------------------------
	83zk38bvaq4nu select * from foo

	1 row selected.

{% endhighlight %}

That extra predicate will look weird at first, but you'll get used to it.


Why Does it Matter?
-------------------

There are many times when it's necessary to search for SQL statements.  Usually it's for ad hoc tuning or debugging, when it doesn't make a big difference if there is one extra row.

But occasionally you need to find one, and only one SQL statement, so you can do something with it.

For example, sometimes in Oracle you want to force a hard-parse.  Normally it's great that Oracle remembers your query, and can learn more on each execution.  But sometimes you don't want it to remember anything.

This can happen when you are running dynamic SQL in SQL, and the return types are not known until run time.  Since the return type can change over time, even for the same input, it's important to flush the statements from the shared pool.  And to save time it helps to only flush the one statement that matters.

This is used in Method5 because the function `M5` need to be re-parsed every time, in case it will return different values.  You can see this in action in the procedure [`method5.m5_purge_sql_from_shared_pool`](https://github.com/method5/method5/blob/88476099a5f979063bfc9d99cf70d4d1b7036e09/code/install_method5_objects.sql).  (There are a bunch of small objects in that file, search for "quine" to find it.)

It's not a common problem, and not incredibly important.  But it's interesting to see spontaneously happen when it's usually quite difficult to create intentionally.
