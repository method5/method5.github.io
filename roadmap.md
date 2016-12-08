---
layout: page
title: Roadmap
---

Possible Future Changes:
------------------------

* **2016-12** _v8.2.0_: Add job timeouts, performance improvements.
* **2017** _v9: Run shell scripts._  I've been using an internal solution for this, but it needs to be re-designed to work in other environments.
* **2017** _v10: Run as SYS and run as SQL\*Plus._  These aren't particularly useful but may be necessary to convince some old-school DBAs.
* **2017** _v11: Offline shell script running with scheduler agents._  This optional feature would add a lot of complexity.  But it would allow Method5 to automate boring tasks like installations and patching.  This would make it a more direct competitor to products like Salt and Ansible.
* **2018** _v12: Web interface._  Method5 is a SQL extension, part of a programming language.  A website doesn't make sense in a lot of ways.  But eventually this may be necessary to convince managers.

The plans get increasingly more speculative as the time increases.  If you would like to request a feature please [create an issue on the repository](https://github.com/method5/method5/issues) or email me at hjon@ventechsolutions.com.


Release History:
----------------

* **2016-11** *v8.1.0:* Added CLUSTER_NAME and Target Groups.
* **2016-10** *8.0.0:* Initial public release.
* **2014 to 2016** *0.0.1 to 7.6.0:* Internal project.
