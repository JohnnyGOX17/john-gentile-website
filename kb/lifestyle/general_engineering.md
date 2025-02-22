---
title: General Engineering & Business
layout: default
kb: true
top-category: Lifestyle & Business
comments: true
---

## General Tenets

* Simple, correct, fast; in that order.
* Be first, be better, or be cheaper.
* What gets measured gets improved. What gets scheduled gets done.
* Follow the [Pareto Principle](https://en.wikipedia.org/wiki/Pareto_principle); 80% of something can be developed in 20% of time. However conversely, the hardest 20% of the design takes 80% of the time (e.g. driving to perfection/shipping quality).
* [Aim to be a monopoly, not a competitor](https://www.youtube.com/watch?v=3Fx5Q8xGU8k)
* Instead of discounting ideas early, simply answer "what would it take?". Never say "that's always how its been done"
* Innovators are not smarter, no more courageous than the rest of us - they are simply better connected. They find ways to exploit the networked landscape. So they are able to innovate continuously by seeing and making connections between people, ideas, and objects from across the broader landscape.
* If your product is perfect, you've released too late. The first person to market can be twice the cost with half the capability, but the second person has to have twice the capability at half the cost to compete.
* Automate & script everything. Leave time for the important stuff.
* Beware of [the XY Problem](https://xyproblem.info/).
* [Learning at work is work, and we must make space for it](https://sloanreview.mit.edu/article/learning-for-a-living/)
* Coders can get writer's block too, try stream-of-conciousness style writing to code development.
* Don't be afraid of failure. It's OK to fail, and failure is temporary. You can try again, try something else, or even go back to a previous job; you're never stuck.
* Open standards & reuse allow you to iterate faster with relatively less NRE.
* Marketing yourself and your product is extremely important, even more so within a large company to your peers & leaders; all the more reason to be a better speaker & writer. It often doesn't even matter if you're the best, think VHS vs Betamax.
* Move processing to data rather than moving data to processing
* Networking can come in the form of being apart of standards bodies (e.g. IEEE) or being a speaker at conferences.


### References

* [Effective_Engineer.md](https://gist.github.com/rondy/af1dee1d28c02e9a225ae55da2674a6f)
* [Essays - Paul Graham](http://www.paulgraham.com/articles.html)
* [Strategy Letter V – Joel on Software](https://www.joelonsoftware.com/2002/06/12/strategy-letter-v/)
* [Rands in Repose](https://randsinrepose.com/)
* [Toyota Kata: Managing People for Improvement, Adaptiveness and Superior Results](https://www.amazon.com/Toyota-Kata-Managing-Improvement-Adaptiveness/dp/0071635238)


## Debugging

The goal is to find out what's wrong, and how to resolve the problem, as quickly and effortlessly as possible. With this, there are some fundamental tips and processes one can undergo to greatly aid in debugging:

### The 9 Indispensable Rules of Debugging

From the book [Debugging: The 9 Indispensable Rules for Finding Even the Most Elusive Software and Hardware Problems by David J Agans](https://www.amazon.com/Debugging-Indispensable-Software-Hardware-Problems/dp/0814474578):

1. [Understand the System](#understand-the-system)
2. Make It Fail
3. Quit Thinking and Look
4. Divide and Conquer
5. Change One Thing at a Time
6. Keep an Audit Trail
7. Check the Plug
8. Get a Fresh View
9. If You Didn't Fix It, It Ain't Fixed

#### Understand the System

It's pretty simple: you don't know what you don't know. Don't let pride or laziness get in the way of learning your system intimately. You should know as much as possible about what the system's supposed to do, how it was designed and even why it was designed that way. To this end, read everything relevant to your system from internal theory of operations to design reviews to comments in low level source code so you have a baseline understanding of what's reasonable.

A deep understanding of the system also lends itself to enabling you to properly fix the bug(s) you find without creating even more havoc or wasted time.

Put simply, make sure you understand the fundamentals of your technical field and just [RTFM](https://en.wikipedia.org/wiki/RTFM) or read all you can, and preferably _before_ you run into problems. However, be careful with reference designs and examples as they can have bugs all their own.




## Technical Writing & Documentation

{% youtube "https://www.youtube.com/watch?v=t4vKPhjcMZg" %}
<br />

Documentation is important, but don't get too caught up on tools and automatic documentation practices, when simply documenting the code inline to begin with gets the job done:
> ...I've personally never seen useful Doxygen/Javadoc style documents. In practice you just get an index of public function names, which is already in the source, so what's the point. If the function and argument names aren't obvious enough or there are caveats, add a comment to the declaration in the header. - Reddit User

<br />
* [The Documentation System- Divio](https://documentation.divio.com/)

