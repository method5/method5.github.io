---
layout: page
---

Method5 is an open source program that extends Oracle SQL to allow remote execution.  It lets database administrators, developers, data analysts, system administrators, security engineers, and other users easily run SQL, PL/SQL, and shell scripts quickly and securely on hundreds of databases.

For example, you can quickly select data from all of your databases with one statement:

{% highlight sql %}
SQL> select * from table(m5('select * from dual'));

DATABASE_NAME  DUMMY
-------------  -----
db01           X
db02           X
db03           X
...
{% endhighlight %}

You can run any SQL statement, PL/SQL block, or Linux/Unix shell command inside the `M5` function or the `M5_PROC` procedure.

The function works with any SQL client and runs on any currently-supported platform, version, or edition of Oracle.  The program lives entirely inside an Oracle database and does not require any additional hardware, privileges, binaries, or money.

Download the full program [here](https://github.com/method5/method5/archive/master.zip).

---

Method5 helps database professionals quickly solve many operational problems.  It can also provide a solid foundation for building robust solutions to common database problems, such as:

<ul class="checkmark">
  <li> Account Management - such as <a href="https://github.com/method5/method5/blob/master/examples/Account%20Maintenance.sql">m5_sync_user</a></li>
  <li> Monitoring</li>
  <li> Security Compliance</li>
  <li> Configuration Management - such as <a href="https://github.com/method5/method5/blob/master/examples/Snare%20-%20Configuration%20Comparison.sql">Snare</a></li>
  <li> Preventive Maintenance</li>
</ul>

This can tip the scales in favor of custom solutions instead of expensive commercial software.

---

See [the user guide](https://github.com/method5/method5/blob/master/user_guide.md) for an explanation of all the features, such as: parameters that control the targets and how the statements are run; where the data, metadata, and errors are stored; running as a procedure; and much more.

---

For more information explore this website, check out [the GitHub repository](https://github.com/method5/method5), or watch the video demo below.

<iframe width="853" height="480" src="https://www.youtube.com/embed/Q_B9cVVM824?rel=0" frameborder="0" allowfullscreen></iframe>
