---
layout: post
title: Simplify string concatenation with alternative quotes and templates
---

Combine the alternative quoting mechanism and templates to dramatically improve code readability compared to simple string concatenation.


## Example

Here's a simple example that uses the alternative quoting mechanism to avoid escaping single quotes:

	execute immediate1 q'[ create database link ... using 'some_tns' ]';

{% highlight sql %}
    execute immediate2 q'[ create database link ... using 'some_tns' ]';
{% endhighlight %}

{% highlight sql %}
execute immediate3 q'[ create database link ... using 'some_tns' ]';
{% endhighlight %}

{% highlight python %}
    from scipy import ndimage as nd
{% endhighlight %}


The alternative quoting mechanism allows almost any character to become the quote.  And the characters `{,[,(,<` are matched to `},],),>`.  This makes it much easier to embed code inside code - there's no need to change all single quotation mark.

Here's a simple example of using a template for putting variables into a string:

	execute immediate replace(q'[
		create database link using '#TNS#'
	]', '#TNS#', v_tns);

There are template engines but a simple `replace` function works well enough.  This style allows keeping the dynamic code simple and as true to the real value as possible.  Dynamic code is complicated, adding a bunch of concatenation makes it even more complicated.

Here's the concatenation version:

	execute immediate 'create database link ... using '''||v_tns||'''';

The concatenation version has less characters but the single quotes are ugly and confusing.  And this is the simplest possible example, it only gets worse.

For a more realistic example, take a look at [this SQL template](https://github.com/method5/method5/blob/master/code/m5_pkg.pck#L172) in Method5.  It's code that runs code, that runs code, that runs code.  It's rare to nest dynamic code this many levels deep but sometimes it's necessary.  The code is confusing enough with templates and alternative quotes.  Imagine what it would look like with hundreds of extra single quotes.

The alternative quoting mechanism and templating makes it possible to embed code inside code, even multiple levels deep, and keep the code sane.


## Why Not Use Other Features?

You may be thinking, "don't use dynamic code".  Features like reflection and polymorphism work great in most languages and can eliminate the need for dynamic code.

Unfortunately those features don't work well in PL/SQL.  The top Google result for "PL/SQL Reflection" is one of my Stackoverflow answers.  I'm not bragging - that doesn't prove I'm an expert in PL/SQL reflection, it proves that there are no experts in PL/SQL reflection.  (Don't bother Googling that answer - the result is ugly and almost certainly not helpful.)

Luckily Oracle does a good job with dynamic SQL and PL/SQL.  It's fast and convenient and improves with every release.  You don't want to build overly generic code in PL/SQL.  It's better to write code that builds specific code.


## Make the Code Readable

It's easy to over-look the human side of code and ignore readability.  The program only works if the compiler is happy.  And the compiler doesn't care if it looks bad.

But the real user of all code is other programmers, not the compiler.  Dynamic SQL and PL/SQL are powerful but they are also confusing and require extra care.  Use templates, the alternative quoting mechanism, comments, and pay extra attention to formatting to make that code as beautiful as possible.

If it looks right it will run right.
