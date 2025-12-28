# Use TypeScript

In their techradar ThoughtWorks adds "Node Overload: a tendency to use Node.js indiscriminately or for the wrong reasons." [^tr]

I slightly disagree, especially the benefits of having the same programming language and tooling is very beneficial.

> TypeScript, it’s a language that builds on JavaScript by adding statically checked types. When you use static types, you can run the TypeScript compiler to check for bugs like typos and mismatches in the shapes of your data, and get handy suggestions. These types don’t change your program, and you can remove them to leave you with clean, readable JavaScript. Going beyond catching bugs in your code, TypeScript also assists you in writing code because types can power useful tooling like auto-complete, go-to-definition, and renaming in your editor! [^ts-announcement]

I see good things happening in teams where traditional frontend and backend developers are comfortable working with the other professions code, and even start to cross boundaries more and more.

Second: multi-threading does not matter in serverless compute environment where functions do one thing and are killed of regularly. They don't have serverless on the radar, yet. [^serverless-tr]

[^tr]: <https://www.thoughtworks.com/radar/platforms?blipid=202005026>
[^ts-announcement]: <https://devblogs.microsoft.com/typescript/announcing-typescript-4-5/>
[^serverless-tr]: <https://www.thoughtworks.com/radar/techniques/serverless-architecture>
