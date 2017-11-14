---
layout: post
title: Use SQL Styles to Reduce Complexity
---


Use these slightly unusual styles to reduce the complexity of SQL code:

1. Avoid Abbreviations
2. Avoid Aliases
3. Use Inline Views
4. Tab Indenting
5. Lower Case

These rules make sense when SQL code complexity is measured by something other than a simple character count, and when the legacy ideas of SQL are abandoned.

Avoid aliases and abbreviations - words are the atomic unit of code
-------------------------------------------------------------------

A word count is a better measure of complexity than a character count.

Drilling down through the hierarchy of a program can go through many different paths.  A PL/SQL program has objects, objects have statements, statements have SQL, etc.  It's easy to end up at a low-level concept like a character, byte, bit, etc.  But those concepts are too low level.

Only complexity as perceived by a human is important.  In general, people think and operate on words, not characters.  We read words - except for weird words or children learning to read.  We type words without even thinking about the letters - except for people who don't know how to type.  A large word is simpler than a few random letters put together.

This statement:

{% highlight plaintext %}
	select *
	from employee
	where employee.name = 'John Smith';
{% highlight plaintext %}

Is simpler than this statement:

{% highlight plaintext %}
	select *
	from employee e
	where e.name = 'John Smith';
{% highlight plaintext %}

The first version has more characters but fewer words.  It also has one less variable, the "e".  This is why aliases should typically be avoided.

Now compare this statement:

{% highlight plaintext %}
	select * from employee;
{% highlight plaintext %}

With this statement:

{% highlight plaintext %}
	select * from emp;
{% highlight plaintext %}

Again the first statement has more characters.  But all English speakers instantly know what an "employee" is.  Reading the full word requires virtually no attention.  The abbreviation "emp" is simple but it still requires a tiny amount of thought.  Why make people think more than they have to?

Abbreviations save characters but require more mental effort and take longer to type.  Unusual abbreviations should be avoided.

Obviously the definition of "unusual" is subjective and depends on the context.  If every programmer on your project instantly recognizes an abbreviation then use it.  But don't invent new ones for every SQL statement and table and don't follow some "abbreviation guideline" that generates cryptic code.



Use inline views - measure joins with chunks and factorials
-----------------------------------------------------------

Once a simple character count is abandoned it is possible to think about code in more logical ways.

Compare the one-join-clause-to-rule-them-all approach:

{% highlight plaintext %}
	select * from t1, t2, t3, t4, t5, t6 ...
{% highlight plaintext %}

With an inline view approach:

{% highlight plaintext %}
	select * from
	(
		select * from t1, t2, t3 ...
	) view1
	join
	(
		select * from t4, t5, t6 ...
	) view2
		on view1...
{% highlight plaintext %}

(Ignore the old-fashioned Oracle join syntax for now.  ANSI joins are superior but that's a separate topic.)

The second version is not only bigger but has additional words, additional joins, and even repeats things.  Yet it is simpler for several reasons.

First, think of inline views as the equivalent of procedures in a procedural language, or functions in a functional language.  Sets are the building blocks of SQL.  There is an elegance to nesting them and creating hierarchies of sets.  You wouldn't use a single, ginormous procedure to do everything in a procedural language, don't make a similar mistake in SQL.

Next think about the different ways to join the tables.  There are 6! (6 factorial, or 6*5*4*3*2*1) ways to order the 6 table join, so there are roughly 720 ways to mentally visualize the tables.  Compared to 3!*2, or roughly 12 ways to visualize the inline views.

I wouldn't say that version 1 is literally 720/12 times more complex than version 2.  But the complexity of adding tables to a join clause is not linear.  We all intuitively know this - at some point a function just gets too big.  It's the same with join clauses.

It can be helpful to think of code in terms of chunking.  Chunking is the idea that our minds constantly group things into chunks and we can only keep a small number of chunks in short term memory at the same time.  Research and common sense suggests the number is small, like between 5 and 7.

So build small, intuitive chunks of SQL using inline views.  Join those chunks and repeat.  This only works with inline views because inline views take no input and have no side effects.  Think of them as pure functions.

This benefit does not extend to correlated subqueries and the WITH clause.  Those features often make code more complex because they introduce side effects and tie everything together.  Both obviously have their place in SQL code.  But if you always use WITH clauses just to make your code read top-to-bottom you're adding a lot of complexity.


Tabs instead of spacing - indenting is for showing parent-child relationships, not random text alignment
--------------------------------------------------------------------------------------------------------

{% highlight plaintext %}
	select ...
	from ...
	where ...
{% highlight plaintext %}

vs.

{% highlight plaintext %}
	select ...
	  from ...
	 where ...
{% highlight plaintext %}

To some people the spaces versus tabs debate boils down to: tabs are sometimes faster but spaces can make things look prettier.

In general I believe in spending the extra time to make code look good but not in this case.

First, the speed different between tabs and spaces is greater in SQL.  This is because SQL auto formatters suck and should be avoided (because SQL is too complex to parse, but that's another topic.)  And beautifiers and IDEs won't help you format dynamic code that looks like a string.  And in PL/SQL dynamic code is critical.  Avoiding dynamic SQL leads to some horrible anti-patterns.

The beauty of spaces is an illusion.  The point of indenting is to show parent-child relationships and make it clear what code is on the same level.  Indenting with tabs and left-justifying keywords makes it abundantly clear what those relationships are.

On a slightly related topic, this is why inline view parentheses should be on their own line like this:

{% highlight plaintext %}
	select *
	from
	(
		select ...
		from ...
	)
{% highlight plaintext %}

Those parentheses are so important they deserve a separate line.  The code between them is an entire state and can exist separate from everything else in the query.  That inline view can be copied and pasted or debugged all by itself.  Inline views are the key to SQL - give them some space.


Use lower case - because SQL is important
-----------------------------------------

Upper-casing SQL probably started because that's how COBOL was written.  Today's SQL is much better than it was in the 1980s, it's time to break with the past and stop typing like an angry teenager.

One current advantage to using upper case for SQL is to help contract it with other languages or writing.  For example, when quoted in this paragraph it looks better to use `SELECT * FROM DUAL;`  There's no mistaking that SQL statement for a regular sentence.  The same applies when embedding SQL as a string in languages like Java and C#.

It makes sense to use upper case for small embedded strings.  But SQL doesn't need to be relegated to that role.  If you're a database programmer then SQL should be your main language.  Your SQL should look good in isolation.  No other modern language uses upper case, using upper case for PL/SQL programs makes them look old fashioned.

Style matters
-------------

Code that looks good will be respected more, maintained better, and is more likely to be reused.  I think most good programmers appreciate beautiful code and enjoy working on things that look good.

There's more than one way to do it and no one should look down on code just because it uses upper case, or spaces instead of tabs.  The important thing is that database programmesr ask themselves, "why am I writing code like this?"  Most SQL code is optimized to save bytes and adhere to tradition.

Code should be optimized for the most important resource - our attention.  Spend extra time to write code that is easier to read.
