---
layout: page
title: Roadmap
---

Possible Future Changes:
------------------------

* **2017-03** _v8.4.0: Version Star._  Add a "version star" to handle column differences between database versions.
* **2017-04** _v8.5.0: 12.2_  Add support for new 12.2 commands.  This will mostly be changes to PL/SQL Lexer.
* **2017** _v8.6.0: Run as SYS_  Add parameter P_RUN_AS_SYS to M5_PROC.  This may need to be an optional component since it may add unacceptable security concerns for some organizations.
* **2017** _v9: Run shell scripts._  I've been using an internal solution for this, but it needs to be re-designed to work in other environments.
* **2017** _v9.1: File copy._  A simple way to copy files from the management host to other hosts could be helpful for running scripts.
* **2017** _v10: Run using SQL\*Plus._  This isn't particularly useful but may be necessary to convince some old-school DBAs.
* **2017** _v11: Offline shell script running with scheduler agents._  This optional feature would add a lot of complexity.  But it would allow Method5 to automate boring tasks like installations and patching.  This would make it a more direct competitor to products like Salt and Ansible.
* **2018** _v12: Web interface._  Method5 is a SQL extension, part of a programming language.  A website doesn't make sense in a lot of ways.  But eventually this may be necessary to convince managers.
* **2018** _Subproject - Monitoring Program._ Method5 could be used to build a database monitoring system.  A simpler version of Oracle Enterprise Manager, one that focuses on using simple tables and SQL statements for monitoring.
* **2018** _Subproject - Security Program._ Method5 could be used to build a security compliance program.  Most security tools are just a collection of SQL statements from the STIG.  It might be relatively easy to build a better version of those expensive programs.

The plans get increasingly more speculative as the time increases.  If you would like to request a feature please [create an issue on the repository](https://github.com/method5/method5/issues) or email me at hjon@ventechsolutions.com.


Release History:
----------------

* **2017-02** *v8.3.0, Scripts:* Simpler installation, improved admin emails, first batch of example scripts.
* **2016-12** *v8.2.0:* Added job timeouts, bug fixes and performance improvements.
* **2016-11** *v8.1.0:* Added CLUSTER_NAME and Target Groups.
* **2016-10** *v8.0.0:* Initial public release.
* **2014 to 2016** *v0.0.1 to v7.6.0:* Internal project.
