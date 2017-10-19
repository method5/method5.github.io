---
layout: post
title: The Difference Between Debugging and Performance Tuning
---

On the surface both performance tuning and debugging follow the same process: find a problem, drill down to the root cause, then fix or work around the underlying problem.

But there's a key difference between the two.  Programmers and administrators who don't understand the difference tend to waste a lot of everyone's time when they try to performance tune.

## Debugging

When debugging you only need to find the **first** problem and then drill down.  The program must work 100% correctly, if even a single byte looks wrong then it should be investigated.  Even if you don't fix the problem you set out to fix you still accomplished something useful.

## Tuning

For performance tuning you need to find the first **significant** problem, and then drill down.  It's easy to get distracted by weird behavior and wait events.  If you don't fix the right problem you'll waste a lot of time.

The art of performance tuning is to gather relevant data and then ignore the 90% of the process that only accounts for 10% of the runtime.  And then ignore the 9% that is slow but is necessarily slow.

## Motivated Troubleshooting

There are many performance tuning dead ends.  I've seen many people, including myself, waste days fixing a problem that could not theoretically improve performance by a significant amount.

We all have the urge to take the easy path and fix problems we are familiar with.  For bug fixing that's usually a good idea - any cleanup is a good thing.  It can be helpful to have a utopian view of the code.  

But performance tuning must stay firmly grounded in reality.  And the ugly truth is that nobody will ever fully understand all the wait events or all the execution plan operations.  We only have time to fix the slow ones.  Don't bother tracing the entire process, sampling is good enough.

For personal education it's helpful to investigate anything that doesn't look right.  But when there's a critical performance problem you must focus on the most important parts.
