---
layout: post
title: Avoid Java in Oracle Database
---

The primary languages of Oracle databases are SQL and PL/SQL.  Despite what many official sources claim, Java in the database is a distant third and should be avoided when possible.

This is not a Java rant and I am not trying to say anything negative about Java as a programming language.  Obviously it's a popular and good choice for working with databases.  Regardless of how good and popular Java is, there are several reasons to avoid using Java stored procedures *inside* an Oracle database.

# Java is Not Always Available

The main problem with using Java inside an Oracle database is that Java is not always available.  Oracle owns Java and has been advertising Java-in-the-database for decades, but in practice you cannot rely on it being installed.

Java is not available for the Express Edition.  I'm not a big fan of Express Edition, but a lot of people use it, so this is a show-stopper for many products.

Java is an optional component in all other editions.  It may be a default, but a lot of DBAs like to remove it because it makes upgrades slower.  Installing components is not a trivial task.  It often requires a DBA and downtime, and in many organizations that would require a lot of paperwork and justification.

# Java Does Not Fit Perfectly

It's unfair to fault a product for not integrating perfectly.  But when SQL and PL/SQL integrate so seamlessly, it's hard not to look at Java stored procedures with disgust.

Of course the types don't completely match.  There's probably all kinds of fun issues with string sizes, character sets, numeric precision, etc.

Java objects can be larger than 30 characters longs, which causes some interesting naming problems.   (Although that problem may be fixed in 12.2 with larger names.).  The objects look different in the data dictionary and virtually all DBA scripts will fail to properly handle Java objects.  This can be fixed by translating the names with `DBMS_JAVA.LONGNAME` but it's a pain.

There's a culture clash between Java and database programmers.  Database programmers want code to "live" in the database, everyone else in the world wants code to "live" in version-controlled text files.  99% of all database programmers are clearly, horribly wrong here.  But you can't convince them (believe me, I've tried), and they "own" the database.

Some of these issues may not apply to [SQLJ](https://en.wikipedia.org/wiki/SQLJ).  SQLJ seems like a neat way to integrate Java and SQL to me, but I'm in a small minority there.  I get the feelings that embedding SQL died in the 90s and nobody wants that kind of product anymore.

# SQL and PL/SQL are Almost Always Better Choices

If you're doing something inside a database then SQL is almost always the best language.  Most people are only familiar with the basics, for running `select * from employee;`.  But Oracle's SQL syntax is incredibly rich, there's hardly any programming task that can't be handled well with SQL.

I've been hired a few times as a "PL/SQL Developer".  What that title really means that really means is that I wrote SQL and tied it together with PL/SQL.

Yes, Java has more powerful language features than PL/SQL.  But they are completely irrelevant 99% of the time.  A good Oracle database program will do almost all of the heavy lifting in SQL.  The procedure language just needs to tie it together.  So PL/SQL's improved integration features more than make up for being a less powerful language.

# This is a Shame

Oracle is missing a huge opportunity here.  It would be so easy to fix - just make Java a required component in all editions!

Until that gets fixed that means you almost certainly should not develop a product with Java inside the database.  This is a shame because there are at least a few cases where it would be *incredibly* useful to call Java from the database.

I would love to be able to reliably take advantage of Java's advantages:
* A more powerful development kit that helps for many tasks, like creating GUIDs, file processing, etc.
* Run existing Java programs, like ANTLR.

For the foreseeable future it's best to do all database processing in SQL and PL/SQL, even if those languages don't seem like a perfect fit for the task.
