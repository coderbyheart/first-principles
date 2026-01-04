# Event Driven Systems {#event-driven-systems}

High level reasons why I want ES:

- fits very well Domain Driven Design [^ddd], having events is very close to natural language, CRUD on tables is not.

- all changes are recorded, therefore answering questions about any kind of activity is very easy to add and can be answered retrospectively
- having events everywhere for everything promotes building decoupled systems
- all changes produce events, this is great for building highly dynamic UIs

This kind of architecture provides high scalability while at the same time being easy to evolve, which is especially helpful in green-field, start-up projects where the product itself constantly evolves and pivots while and there is no historical understanding of usage patterns.

## Make create operations succeed eventually not immediately

In order to effectively build cloud native applications which scale horizontally we have to embrace eventual consistency in our storage. Although our primary storage my offer real-time persistence, other components we use to may required longer to process incoming data.

Therefore generally never try to return the Entity that was just created.

    > POST /books
    > title: Foo
    >
    > HTTP/1.0 202 Accepted

This allows us to be more flexible in the way we process writes and can start with writing synchronously to a table and later switch to an Event based storage.

**There is no need to immediately return an ID of a create operation**

Instead, offer the a way to subscribe to events which notify it if the item has been created. It can also poll the list of items.

## Do not proxy Third Party (RESTful) APIs

_Do not make the user wait on a machine, let another machine do the waiting._

Third party APIs are those which are outside of your execution environment, and which you do not own. This applies to all kinds of APIs, not only REST.

The access to third party APIs should be implemented as a separate service (called ACME service here), since tight coupling them into our workflows would mean we would make the performance and availability of the third party API our immediate concern when it comes to response times towards users.

All interaction with the third party API should be invoked out of band.

Implement a high-level API in your business domain that does not leak vendor specific details (following DDD [^ddd]) so the actual underlying service provided by the 3rd party can later be swapped out without needing to refactor your core application.

### Write Methods

Calls to the write methods to this high-level API will result in a respective event being persisted and dispatched on the event bus.

Now the ACME service can listen to these events and try to fulfill them. It should use workflow orchestration (like AWS Step Functions [^step-functions]) to simplify the coordination of retries in case the 3rd party API is down which will also yield a way to see which requests are not yet fulfilled or timed out.

If the request was fulfilled or failed, the ACME service will notify the core to record the result.

### Read Methods

Calls to the read methods can be handled in band by the core because they would use the aggregated view to serve the request.

Depending on the use case, the ACME service is responsible for regularly fetching information and notifying the core of changes. If this is needed on-demand the same flow as described above for write methods could be used.

This has the advantage that there is no way of flooding the third party API, since the ACME service can throttle requests.

[^step-functions]: <https://aws.amazon.com/step-functions/>

## Resources

- Mistakes we made adopting event sourcing (and how we recovered):  
  <http://natpryce.com/articles/000819.html>
