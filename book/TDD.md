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

## Write tests.

One of the biggest learnings in my career is how writing software test‑driven changed everything.
There are tons of resources on test‑driven development, so I won’t repeat them, but I’d like to share a bit of how I teach TDD.

When I introduce juniors or beginners to TDD, they often already believe that writing tests is really hard. That impression comes from learning to program by just coding, and only later being taught the concept of tests—adding tests after the code has been written, essentially doing black‑box testing.

For example, in university you might write a calculator and then create a separate program that interfaces with your calculator implementation to verify it works as expected. This works for a small program, but as software becomes more complex it gets harder—and sometimes impossible—to add tests after the fact.

And to be clear: this is not TDD. In TDD you write the tests _before_ you write the implementation. Not doing this is the biggest source of headaches when it comes to writing tests.

In the chapter [_Wishful thining_](#wishful-thinking) I wrote about how outside‑in design for me is key to software development. Beginners who struggle with testing often haven’t followed outside‑in design, and tightly coupled, overly complex dependencies and large, monolithic pieces of code.

What makes TDD work for me is thinking in the Unix design philosophy: many tiny, functional pieces of code that can be tied together using events and have clear dependencies. If you encounter that your method has too many dependencies which makes it hard to mock, it is the code telling you to take a step back and refactor your dependencies: there is most likely a way to simplify them and introduce another higher-order component that abstracts the workflow you are invoking. Or is it possible to decouple the workflow into separate, paralell steps that can be decoubled using events (see the chapter about [_Event Sourcing_](#event-sourcing)).

It is also important to remember that TDD isn’t about achieving 100 % line coverage. Especially with TypeScript, the language itself catches many errors—like passing the wrong type to a function—so we don’t need a test for every type mismatch.

Writing tests isn’t performative; it is there to ensure our assumptions about business logic are correctly implemented.

## Use ubiquitous language in your mock data

When I write unit tests (and I encourage everyone to do the same), I avoid random mock data. Instead, I use domain‑specific examples. For instance, if you’re building a database that stores books, your test should store a realistic book object. If you have IDs, use the correct ID format. If you have a pricing table and calculator, use realistic prices. Using realistic data prevents confusion about the shape of production data and makes it easier to spot issues.

## Spike without tests to find the right architecture, then rewrite using TDD.

Typically when I design a new architecture, I find that TDD is not helping in finding a good solution, it often takes two or three tries to get the architect right and rewriting the tests all the time creates a lot of extra work. (This phase is called "a spike".)

So, once you have found the solution, rewrite it using outside-in TDD.

The end-to-end BDD tests you may have written during the spike can be re-used.

## Invest in end-to-end tests

Building cloud-native solutions means leveraging the power of highly scalable, often proprietary components, which can no longer be run locally on the developer's machine. A critical part of the solution is also the configuration which ties these components together.

End-to-end testing provides a way to ensure that the entire solution is working properly and that changes not only in code and dependencies but also on the provider side are catched immediately.

End-to-end tests are not tied to the implementation and during refactoring one cannot accidentally drop tests: tests written for test runners like Jest tend to be tied closely to the API of the source-code implementation, in a case of bigger refactoring the tests themselves usually need to be refactored as well. Since the end-to-end tests are purely testing based on the public API of the project, they can be kept unchanged during refactoring.

This also provides an easily grokable description of the working and implemented projects features in one folder (example).

This [^e2e-talk] is a talk I gave about this topic if you want to learn more.

## It takes years to be confident

Finally, mastering this skill takes time. It can take years to become comfortable writing tests and structuring code in a way that it is testable. But the payoff is huge: a flexible, modular codebase that can be changed easily.

In my teams, I treat testability as a non‑negotiable. I help people understand its value and support them when they struggle. We all struggle with writing tests, and there’s no shame in asking a colleague, “How could I test this?” If you’re stuck, reach out for help.

## Literature

- Kent Beck: Canon TDD
  <https://tidyfirst.substack.com/p/canon-tdd>
- Kent Beck: Test-driven development by Example
  <https://www.oreilly.com/library/view/test-driven-development/0321146530/>
- Saleem Siddiqui: Learning Test-Driven Development  
  <https://www.oreilly.com/library/view/learning-test-driven-development/9781098106461/>
- Chew Choon Keat: TDD for those who don't need it  
  <https://youtu.be/a6oP24CSdUg>
- David Bernstein: Unit Tests as Specifications  
  <https://www.youtube.com/watch?v=L9ZZgF861dg>
- Ian Cooper: TDD, Where Did It All Go Wrong  
  <https://www.youtube.com/watch?v=EZ05e7EMOLM>
- Konstantin Kudryashov: The beginner's guide to BDD (behaviour-driven development)  
  <https://inviqa.com/blog/bdd-guide>
