---
layout: page
title: Contribute
---

How to contribute
-----------------

The best way to get involved with Method5 is through [the GitHub repository.](https://github.com/method5/method5/)  Create an issue if you find bugs or have an idea for a new feature.

Or fork the code, make changes, and create a pull request.

Or you can email me at <a href="mailto:hjon@ventechsolutions.com?Subject=Method5" target="_top">hjon@ventechsolutions.com</a>.

Tips for developing
-------------------

Here are some things to keep in mind if you want to customize or extend Method5:

1. **Skill level** You'll probably need to be an expert in Oracle SQL and PL/SQL to modify the source code.
2. **Oracle software** You can use [any currently-supported version or edition of Oracle.](http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html)
3. **Lexer** A few of the language classification and transformation steps are provided by a separate project, [PLSQL_LEXER](https://github.com/method5/plsql_lexer).  It is a proper lexer meant to be 100% accurate, not the hastily assembled regular expressions that most people use.  This makes up most of the code base but you can probably ignore it.
4. **Oracle Data Cartridge** The ability to return a dynamic list of columns is based on the [Method4 project](https://github.com/method5/method4), which is based on [this oracle-developer.net article](http://www.oracle-developer.net/display.php?id=422) by Adrian Billington.  It uses Oracle Data Cartridge, which is one of the most cryptic and difficult Oracle technologies.  You should probably try to avoid that code if possible.
5. **Unit Tests** The project uses a lot of automated testing.  If you want to contribute code, make sure the existing unit tests pass and that you create tests for your code.
