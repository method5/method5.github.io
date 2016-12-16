---
layout: page
---

Method5 is an open source program that extends Oracle SQL to allow parallel remote execution. It lets database administrators easily run SQL statements quickly and securely on hundreds of databases.

For example, you can quickly select data from all of your databases with one statement:

```sql
SQL> select * from table(m5('select * from dual'));

DATABASE_NAME  DUMMY
-------------  -----
db01           X
db02           X
db03           X
...
```

You can run any SQL or PL/SQL statement inside the `M5` function. The function works with any SQL client and runs on any currently-supported platform, version, or edition of Oracle.

Method5 helps DBAs quickly solve many operational problems.  It also provides a good foundation for building robust solutions to common database problems, such as account management, monitoring, security compliance, configuration management, and preventive maintenance.  This can tip the scales in favor of custom solutions instead of expensive commercial software.

See [the user guide](https://github.com/VentechCMS/method5/blob/master/user_guide.md) for an explanation of all the features, such as: parameters that control the targets and how the statements are run; where the data, metadata, and errors are stored; running as a procedure; and much more.

For more information explore this website or check out [the GitHub repository](https://github.com/method5/method5).
