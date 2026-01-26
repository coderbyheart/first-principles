# Run your infra

I think developers and all developers should run their infrastructure.

It's really an important experience to learn how the software that you're writing interacts with the environment it runs in under the load it has to handle and the request patterns that you fail to imagine in your tests.

One of the real benefits of building serverless infrastructure is that in a serverless development model, the infrastructure is tied closely to the implementation code.

For every function that I write, for every small little piece, I get my own small execution environment that gets provisioned alongside the function.

I have to wire it up to the API gateway so the requests can be handled by the function, and I have to wire it up to the databases that it uses for reading and writing data.

Since I have to adapt my programming model to a serverless environment, I have to really think and understand how to orchestrate the architecture.

The reality is that with serverless, the architecture doesn't go away. The server or the computer that once was a metal box in a big rack is, yes, today just a tiny little VM that lives for a few minutes and then is garbage collected, but it still exists. And we still have to consider this and how it's integrated with all the other components that we have, like networking, like storage and persistence.

When we do this on a day-by-day basis and in really small iterations, when it becomes so easy to spin up a new web service, then it takes the pain away of managing your infrastructure.

I can spin up a HTTP endpoint in one or two minutes with a function URL of a Lambda function on AWS, for example. That gives me a public REST API that can receive traffic and that scales with traffic.

I can scale this easily to a small to medium website and will then start adding an API gateway on top of it when it's needed or when I need it for better orchestration.

This allows me to grow the architecture in a way that is driven by the need of the problem, the need of the business.

Very similar to the outside-in design for software and testing, I can apply the same approach for my architecture.

When I depend on and utilize serverless services from AWS—and I'm sorry that I'm repeating myself here, but it has been really beneficial for me to build on AWS—then I can have the confidence that if I start super small and it looks tiny, I can keep growing and growing, step by step, the implementation, and it will scale.

I don't have to worry about finding the right configuration, as long as I build an architecture that is decoupled, event-driven, and does not try to do too many things at the same time.

If you build on serverless with a serverless architecture, your main goal is to take an incoming request and acknowledge it and stop processing this request as soon as possible.

That might mean that you're building a REST API that instead of returning a 200, it returns a 201.

And if you're wondering what the difference is, 201 means HTTP accepted. It might mean that you take the payload that the request has given you and you stop processing it right away and put it on a queue or put it in a DynamoDB, where you then can handle the processing out of band, which allows your Lambda function to return immediately and not consume more resources.

This is especially important if you have a function that has many steps that it needs to process.

Let's say you have a system that allows users to write a message. So you have a post endpoint that accepts the new message.

The first thing after, of course, authenticating that the user can post a message, you want to store that message in a database, but you also want to notify other users that there's a message. Maybe you want to send a few emails. Some of them have an active chat client where you want to send it. And you also want to update the original author's statistics.

In a classical procedural implementation, you would do these things step by step, or you would have promises that you can kick off and then wait for all of them to complete while your post request is still hanging.

I know most of you haven't done this in a long time, but to be successful with a serverless architecture, we really want to take this to the extreme.

We want to basically only check that the preconditions are correct for a request—that means authentication, is the format correct, does the business logic allow the change to the system?

And if so, we take the payload and do the cheapest and most relevant thing, probably appending a post to our database. If that's done, we return a request.

Then we have event listeners. And by that I mean not event listeners within Node.js, for example, but we have a subscription to the DynamoDB table that then kicks off another Lambda.

And not only one Lambda, but one Lambda that does the notification of users, another Lambda that does the WebSocket notifications, a third Lambda that sends and updates statistics of users and processes that.

So you really want to fan out all your work into individual smaller components and smaller functions because then it's more likely that most of your system still works and some of the parts may not. If they are broken, they don't affect the execution of the others.

And this is really an essential design pattern that we want to apply in our architecture.
