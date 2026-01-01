\newpage

# Event Sourcing {#event-sourcing}

High level reasons why I want ES:

- fits very well Domain Driven Design[^ddd], having events is very close to natural language, CRUD on tables is not.
- enables to build highly specialized (and therefore fast) read models while not prescribing a certain storage solution
- no more DB schema migrations, the data model can easily be extended and changed
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

## Further reading

- [Mistakes we made adopting event sourcing (and how we recovered)](http://natpryce.com/articles/000819.html)
