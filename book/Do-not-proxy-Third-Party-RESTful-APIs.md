\newpage

# Do not proxy Third Party (RESTful) APIs

_Do not make the user wait on a machine, let another machine do the waiting._

Third party APIs are those which are outside of your execution environment, and which you do not own. This applies to all kinds of APIs, not only REST.

The access to third party APIs should be implemented as a separate service (called ACME service here), since tight coupling them into our workflows would mean we would make the performance and availability of the third party API our immediate concern when it comes to response times towards users.

All interaction with the third party API should be invoked out of band.

Implement a high-level API in your business domain that does not leak vendor specific details (following DDD[^ddd]) so the actual underlying service provided by the 3rd party can later be swapped out without needing to refactor your core application.

### Write Methods

Calls to the write methods to this high-level API will result in a respective event being persisted and dispatched on the event bus.

Now the ACME service can listen to these events and try to fulfill them. It should use workflow orchestration (like AWS Step Functions[^step-functions]) to simplify the coordination of retries in case the 3rd party API is down which will also yield a way to see which requests are not yet fulfilled or timed out.

If the request was fulfilled or failed, the ACME service will notify the core to record the result.

### Read Methods

Calls to the read methods can be handled in band by the core because they would use the aggregated view to serve the request.

Depending on the use case, the ACME service is responsible for regularly fetching information and notifying the core of changes. If this is needed on-demand the same flow as described above for write methods could be used.

This has the advantage that there is no way of flooding the third party API, since the ACME service can throttle requests.

[^step-functions]: https://aws.amazon.com/step-functions/
