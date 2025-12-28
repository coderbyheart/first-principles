# Test Driven Development (TDD) {#tdd}

_More specifically, outside-in TDD with end-to-end BDD tests._

> – We don't write tests.
> – Why?
> – Because we don’t have time for it.
> – Why?
> – Because there is too much work and pressure.
> – Why?
> – Because we don’t move fast enough.
> – Why?
> – Because changing software has become difficult and risky.
> – Why?
> – Because we don’t write tests.
> — _Eduard Sizov_ [^status-1381633331230601221]

Write tests.

Typically when I design a new architecture, I find that TDD is not helping in finding a good solution, it often takes two or three tries to get the architect right and rewriting the tests all the time creates a lot of extra work. (This phase is called "a spike".)

So, once you have found the solution, rewrite it using outside-in TDD.

The end-to-end BDD tests you may have written during the spike can be re-used.

## Invest in end-to-end tests

Building cloud-native solutions means leveraging the power of highly scalable, often proprietary components, which can no longer be run locally on the developer's machine. A critical part of the solution is also the configuration which ties these components together.

End-to-end testing provides a way to ensure that the entire solution is working properly and that changes not only in code and dependencies but also on the provider side are catched immediately.

End-to-end tests are not tied to the implementation and during refactoring one cannot accidentally drop tests: tests written for test runners like Jest tend to be tied closely to the API of the source-code implementation, in a case of bigger refactoring the tests themselves usually need to be refactored as well. Since the end-to-end tests are purely testing based on the public API of the project, they can be kept unchanged during refactoring.

This also provides an easily grokable description of the working and implemented projects features in one folder (example).

Here is a talk I gave about this topic. [^e2e-talk]

## Literature

- TDD for this who don't need it  
  <https://youtu.be/a6oP24CSdUg>
- Unit Tests as Specifications  
  <https://youtu.be/3oIe8JPloaw>
- TDD, Where Did It All Go Wrong
  <https://www.youtube.com/watch?v=EZ05e7EMOLM>
- <https://specflow.org/blog/bdd-before-you-begin-part-1/>
- <https://dannorth.net/introducing-bdd/>
- <https://cucumber.io/docs/guides/bdd-tutorial/>
- <https://inviqa.com/blog/bdd-guide>

