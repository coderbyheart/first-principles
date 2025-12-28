# CQRS

Especially in serverless environments, there are often components which are by design eventual consistent (for example AWS IoT). It is not possible to expose these underlying services in with strong consistency without a huge impact on the time it takes to fulfill a request that applies changes those underlying components.

## Literature

- <https://martinfowler.com/bliki/CQRS.html>
- <https://www.pluralsight.com/courses/cqrs-in-practice>
- <https://www.youtube.com/watch?v=rolfJR9ERxo>
- <https://altkomsoftware.pl/en/blog/cqrs-event-sourcing/>
- <https://codemonkey.blog/cqrs-is-an-anti-pattern-for-ddd/>
