# Prototypes are better than 10,000 words in a meeting

_No meeting, design document, or presentation can ever be as good as building a simple prototype of the thing we are trying to build._

In my career I have sat in very few meetings about a software project that felt truly productive. Instead what happens mostly is that the participants agree on an outcome, and write down _some_ notes. We now have a distributed state of knowledge without, with many ambiguities which we will only discover in a later state of the project.

What has been truly satisfying for me where however building simple prototypes. For once because this is what I enjoy most: writing software. But also, because only then can all stakeholders use the same thing and discuss on a concrete deliverable if it fits their expectation or not.

The other advantage of working prototypes is that they are already the first [Walking Skeleton](#walking-skeleton) and can be use to set up the [Continuous Delivery workflow](#push-to-deploy) for the project.

## Using documents to design software is an anti-pattern

Many teams use a form of open document to discuss projects asynchronously. This also includes using an issue tracker to record backlog items. There are multiple flaws in this process.

First, the ability for everyone to add more content to these documents by amending them, creating a new issue, or adding a comment, turns them into never-ending input streams. They provide an unlimited surface for new ideas to be attached, new what-ifs to be discussed, and tasks to be created. The problem here is that it is too easy to add content, without having to pay the price. This binds a lot of resources, and creates the need for everyone involved to review and react to a new piece of input—because it would be seen as impolite to disregard the input of a fellow coworker.

Second, this invites people without _skin in the game_ to get involved and us this as a performative action to increase their (perceived) worth within an organizations. This will artificially inflate problems, especially within engineering organizations. Eventually the documented risks will always outweigh the opportunities, because all of us have seen things go wrong hundreds of times, but never experienced the value created by the thing we are going to build.

Third, these documents never expire and outdate quickly. They are available through (ML enabled) search and will resurface again and again. They do not reflect what is in production, because they are not tied to the source code of the project, but live in an entirely different system.

## Lean proposals with a bias to start building

I prefer to work on a proposal with only the people that have committed resources to the project to draft a rough document that outlines what should be built, and to agree on the timeframe. Identify any blockers and solve them, but then start to work on the real thing quickly. Use the working software to iterate, not the document. Read more about my preferred way to manage software development in [this chapter](#what-to-work-on). Do use the bug tracker to record features. [A bug tracker should have 0 open tickets.](#zero-bug-policy).

## Literature

- A Structured RFC Process, Phil Calçado  
  <https://philcalcado.com/2018/11/19/a_structured_rfc_process.html>
- Collaboration sucks: Charles Cook  
  <https://newsletter.posthog.com/p/collaboration-sucks>
