---
layout: page
title: Roadmap
---

Possible Future Changes:
------------------------

* **2018** _Subproject - Security Program._ Method5 could be used to build a security compliance program.  Most security tools are just a collection of SQL statements from the STIG.  It might be relatively easy to build a better version of those expensive programs.
* **2018** _v10: File copy._  A simple way to copy files from the management host to other hosts could be helpful for running scripts.
* **2018** _v11: Run SQL\*Plus scripts._  This isn't particularly useful but may be necessary to convince some old-school DBAs.
* **2018** _v12: Offline shell script running with scheduler agents._  This optional feature would add a lot of complexity.  But it would allow Method5 to automate boring tasks like installations and patching.  This would make it a more direct competitor to products like Salt and Ansible.
* **2018** _v13: Web interface._  An APEX front-end to Method5 could help some users.  It would primarily be a SQL editor with  hints on how to use the Method5 APIs.  Sort of like SQL Fiddle.  It could also include screens for helping with administrative tasks, such as setting up Method5 users, roles, and other configuration.
* **2018** _Subproject - Monitoring Program._ Method5 could be used to build a database monitoring system.  A simpler version of Oracle Enterprise Manager, one that focuses on using simple tables and SQL statements for monitoring.

The plans get increasingly more speculative as the time increases.  If you would like to request a feature please [create an issue on the repository](https://github.com/method5/method5/issues) or email me at jon@jonheller.org.


Release History:
----------------

* **2018-02** _v9.0: Security Enhancements._  Added configurable privileges.  Now non-DBAs can safely use Method5.
* **2017-10** _v8.8.4: Shell commands._  Added ability to run Linux/Unix shell commands and scripts.
* **2017-07** _v8.7.2: P_RUN_AS_SYS._  Added ability to run commands as SYS.
* **2017-06** _v8.6.1: Bug fixes._  Allow un-aliased column expressions over 30 bytes.
* **2017-05** _v8.6.0: M5_SYNCH_USER._  Added procedure M5_SYNCH_USER to simplify account management.
* **2017-04** _v8.5.1: 12.2._  Add support for new 12.2 commands and long identifiers.
* **2017-03** _v8.4.0: Version Star._  Added version star feature, LONG support, and other minor fixes.
* **2017-02** *v8.3.0: Scripts.* Simpler installation, improved admin emails, first batch of example scripts.
* **2016-12** *v8.2.0:* Added job timeouts, bug fixes and performance improvements.
* **2016-11** *v8.1.0:* Added CLUSTER_NAME and Target Groups.
* **2016-10** *v8.0.0:* Initial public release.
* **2014 to 2016** *v0.0.1 to v7.6.0:* Internal project.
