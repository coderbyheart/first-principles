\newpage

# Separate workflows through events

## Bad

```javascript
class UserManager {
  async createUser(email) {
    const id = await this.userRepo.insert(email);
    await this.upgradeAccount(id, "trial");
    await this.sendConfirmationEmail(email);
    await this.notifySlack(`Woot! ${email} has registered`);
  }
}
```

The UserManager does too many things and needs to know all these dependencies. There is no clear limit to what could be added there in the future, that needs to be done when a user is created. This can increase the runtime of this one method further and further and couples systems that not need to be coupled.

## Good

Instead have all methods that change the state of the system only do exactly on operation and use Events to have other components get notified. This enables to run these secondary operations in a separate process and even in an environment which is better suited for them.

```javascript
class UserManager {
  async createUser(email) {
    const id = await this.userRepo.insert(email);
    this.eventBus.publish("UserCreatedEvent", { id, email });
  }
}

class TransactionalMailer {
  construct(eventBus) {
    eventBus.on("UserCreated", (name, { email }) =>
      this.sendConfirmationEmail(email),
    );
  }
}
```

This is enabled by implementing Event Sourcing (see [chapter @sec:event-sourcing]).
