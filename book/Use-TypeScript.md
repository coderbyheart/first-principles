\newpage

# Use TypeScript

In their techradar ThoughtWorks adds "Node Overload: a tendency to use Node.js indiscriminately or for the wrong reasons." [^tr]

I slightly disagree, especially the benefits of having the same programming language and tooling is very beneficial.

> TypeScript, it’s a language that builds on JavaScript by adding statically checked types. When you use static types, you can run the TypeScript compiler to check for bugs like typos and mismatches in the shapes of your data, and get handy suggestions. These types don’t change your program, and you can remove them to leave you with clean, readable JavaScript. Going beyond catching bugs in your code, TypeScript also assists you in writing code because types can power useful tooling like auto-complete, go-to-definition, and renaming in your editor! [^ts-announcement]

I see good things happening in teams where traditional frontend and backend developers are comfortable working with the other professions code, and even start to cross boundaries more and more.

Second: multi-threading does not matter in serverless compute environment where functions do one thing and are killed of regularly. They don't have serverless on the radar, yet. [^serverless-tr]

## Why I’m Excited About Using TypeScript End‑to‑End

When I first started thinking about how to streamline development across the front‑end and back‑end, it became clear that a single language could solve many of the friction points we face daily. That’s why I’m such a fan of **TypeScript**—it lets us share code, validation logic, and tooling between the client and the server with minimal overhead.

## A Unified Repository Model

In most organizations I’ve seen, the back‑end lives in its own repository, containing a Node.js (or other) server implementation, while the front‑end sits in a separate repo with a React codebase. Both are usually written in JavaScript, which means we end up duplicating types, validation rules, and even some business logic.

To address this, I created a small **“portal repository.”** This repo houses the domain objects that travel back and forth between client and server, along with the validation rules that apply to them. By centralising these definitions, we eliminate the need to keep two sets of typings in sync.

## Validation with TypeBox and JSON Schema

For runtime validation I rely on **[TypeBox](https://github.com/sinclairzx81/typebox)**, which generates performant validators from JSON Schema definitions. While JSON Schema isn’t perfect—it struggles with complex inter‑field dependencies—it covers roughly **98 %** of our needs. When we encounter edge cases, we augment the schema with custom TypeScript code that enforces the more intricate business rules.

## Benefits of a Single Language Stack

1. **Shared Codebase** – Front‑end and back‑end developers write the exact same types and utility functions. This reduces bugs caused by mismatched contracts and speeds up onboarding.
2. **Consistent Tooling** – Linting, formatting, and build pipelines are identical across both sides of the stack. Developers can switch between front‑end and back‑end tasks without learning new configurations.
3. **Easier Team Mobility** – Because the language and tooling are uniform, engineers who traditionally worked on PHP or Java back‑ends can comfortably contribute to React components, and vice‑versa. In my experience, this flexibility dramatically improves collaboration.
4. **Rich Ecosystem** – TypeScript’s massive package registry means almost any functionality you need already exists as a well‑maintained library. From state management to data validation, there’s likely a vetted solution ready to plug in.

## Overcoming Past Hesitations

Historically, many back‑end developers were reluctant to touch front‑end code, fearing the “messiness” of HTML, CSS, and JavaScript. Introducing TypeScript alongside React changed that perception. The strong typing and familiar syntax make the front‑end feel like a natural extension of the server code. Even simple UI tweaks become approachable when the underlying business logic lives in reusable, testable TypeScript modules.

## My Recommendation

If you’re evaluating a technology stack for a new project—or looking to modernise an existing one—I wholeheartedly recommend adopting **TypeScript across the whole stack**. It not only simplifies the development workflow but also future‑proofs your codebase by leveraging a language that continues to dominate the industry.

In short, having one implementation language from the database layer all the way to the browser yields a more cohesive, maintainable, and enjoyable engineering experience. And with tools like **TypeBox** to handle validation, the benefits are practically undeniable.

[^tr]: <https://www.thoughtworks.com/radar/platforms?blipid=202005026>

[^ts-announcement]: <https://devblogs.microsoft.com/typescript/announcing-typescript-4-5/>

[^serverless-tr]: <https://www.thoughtworks.com/radar/techniques/serverless-architecture>
