# Wishful Thinking: An Outside‑In Approach to Simpler Software {#wishful-thinking}

_Start with outside-in TDD to arrive at the most minimal API that implements the business needs of the feature you are building using the domain language._

There isn’t a larger contributor to software complexity than writing code that isn’t needed and trying to optimise for every possible eventuality. To combat that, I rely on a method I call **wishful thinking**.

When I begin a new implementation, I design the system **from the outside in**. I start with the outermost API—typically a REST endpoint or a message that will be exchanged between services—and I define that interface first.

From there I move one layer deeper. In a web application, the next piece is usually the controller that receives the HTTP request. I immediately write a test that describes the API I expect to call. In that test I sketch the calls and arguments in pseudo‑code, exactly as I wish they existed, keeping the description as simple as possible.

At this stage I don’t worry about breaking the implementation into separate modules. I simply imagine the whole thing existing as described.

Because the test comes first, I can mock all collaborators.

- If I need a repository to store a book, I create a **mock bookstore** that returns a book.
- I never have to decide which database technology to use or how the persistence layer will look; I just provide a mock that satisfies the contract.

This lets me focus on the **flow of data**: what the client invokes and what it should receive. By following this outside‑in path, I only design the minimal interface and implementation required to fulfil the current task.

The outside‑in philosophy aligns well with **Test‑Driven Development (TDD)** and **Behavior‑Driven Design (BDD)**. In practice I:

1. Write a **markdown test document** that describes the REST API calls a client will make.
2. Turn that document into **executable test code**.
3. Run the test repeatedly, letting it fail until I implement just enough code for it to pass.

This process can keep the test suite in a failing state for several days, but it gives a crystal‑clear definition of **when a feature is truly complete**.

## Benefits and Trade‑offs

- **Clarity:** You always know what the next task is because the test defines the expected behaviour.
- **Minimalism:** Only the interfaces and implementations needed for the current feature are built.
- **Risk:** Working with mock implementations means some parts of the system remain untested until later, which can delay integration issues.

## Contrast With Inside‑Out Design

Designing from the inside out feels natural at first: “I need a way to store books, so I’ll pick a database, set up an ORM, create repository classes, expose `list`, `findByTitle`, `findByAuthor` methods, and so on.” That mindset quickly leads to building **more features than necessary**—for example, a search‑by‑author function that no concrete use case actually demands.

When you start from the inside, your mind wanders to every possible future requirement, and you end up adding a lot of scaffolding that never gets used.

## Bottom Line

By starting with the outermost contract, mocking everything else, and iterating inward only as far as the current test requires, I avoid the temptation to over‑engineer. This “wishful thinking” approach keeps software lean, focused, and easier to evolve.

## Resources

- Georgina McFadyen: TDD - From the Inside Out or the Outside In? <https://8thlight.com/insights/tdd-from-the-inside-out-or-the-outside-in>
