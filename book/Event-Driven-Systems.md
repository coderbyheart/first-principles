# Event Driven Systems {#event-driven-systems}

I've been using event-driven systems and event-driven architectures before I switched over to serverless architectures. However, it is clearly the predominant architecture design for serverless systems.

A serverless platform really benefits from an architecture if you think in terms of events instead of a procedural flow of actions. You make small changes based on the main action. For example, a user registers, and then everything that happens afterwards—like sending an email notification or creating new resources (let's say the user needs a new project)—is not inline in the same code that does the registration. Instead, your system records a change. You get a `UserCreated` event, and that is then subscribed to by other components who implement their own business logic.

The benefit is that you get many small components in your system that act individually on changes, which really makes them much easier to test and reason about. If you imagine having a big controller class that writes something to the database, calls an email handler, then calls a project creator, then calls another manager who does something, you have basically created a place that would keep growing and growing if you add more features.

So if you start with only one thing and have every following change or business rule implemented in a different piece of code, then you can really grow your system easily without having to touch one place again and again when a feature changes.

This is more or less the unix philosophy: a program (or function) should do one thing only. This allows for flexible orchestration of workflows and small functions are much easier to reason about; and of course the test, which is probably the strongest reason why I prefer them.

## Event Storming

Building event-driven systems is an architectural style that fits very well with domain-driven design, and especially a technique called Event Storming [^event-storming]. Event Storming brings all stakeholders together in a room to discuss, using ubiquitous language (which I mentioned in the previous chapter), what should happen in a system.

Event Storming was developed by Alberto Brandolini. It helps to understand what should happen in a software system through the use of a few elements: events (describe the state change in the system), commands (describes what should happen), actors (describe who is executing commands), and aggregates (persist state). The outcome of a command that is executed by an actor, if the command is valid according to the business rules, is an event. Business rules are als very often recorded in Event Storming session.

This allows all stakeholders to use more or less natural language to describe what the system does without needing to go too much into the technical details of the implementation. You stay at this level, and then you are able to transfer what you establish in an Event Storming session into software. And in the software, you repeat these elements. You have events when the system changes, you have commands that actually change the system, you have actors that could be used for specific roles, and they are reflected in your software.

This input is incredibly helpful to build software that follows and solves what the business needs. And in order to solve this in a very good way, you have to constantly talk with business and stakeholders.

For me this is a mental model that helps me to ask the right questions. I can event run Event Storming sessions with any stakeholder, for example a product manager, to figure out what should happen in the feature they want to build, without them needing to know anything about it. I can ask:

> Given a state of the system (which aggregates are involved), who (actor), can do (business rule) what (command), with which outcome (event)?

I can basically turn the answer into a BDD scenario (see [TDD](#tdd)) in the `Given, When, Then` format right in the meeting.

## The value of state change events

Anecdotally, I've seen multiple times in my career the need by business to learn something about user behavior. For example, asking the question: "How many users signed up during the first six months of this year?" In a classical CRUD system, you would have a database with user entries. There would be 5,000 users, for example. And then you would look at maybe the "created at" date. You would see, okay, in the first six months of this year, there were 250 sign-ups. These are some typical metrics or metadata that we record in a CRUD system. But you, for example, wouldn't know how many of those users changed their email address in those six months, because the "updated at" value is change every time something in the record changes, and you wouldn't even know if the email was changed or not, since the user was created.

When you have events for everything in your system, however, we can replay every change in the system at any given point in time, and we can build analytics around this. This gives us business intelligence and insight into our data, and we can answer questions that we didn't even know we wanted to ask in the first place.

## Build loosely coupled systems

Building Event Driven Systems give me the ability to build loosely coupled systems which can grown and evolved without having to consider side-effects. For me this keeps the mental load low, and the speed of delivery very high.

## Resources

- <https://EventStorming.com>
- Alberto Brandolini: 50,000 Orange Stickies Later  
  <https://www.youtube.com/watch?v=1i6QYvYhlYQ>

[^event-storming]: <https://ziobrando.blogspot.com/2013/11/introducing-event-storming.html>
