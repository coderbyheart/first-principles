# No staging

I strongly advice against introducing staging environments.

This is effectively doubling the work that teams have to run their services, because now velocity depends on maintaining 2 environments: on staging environment, and one production environment. Both must be maintained to be up and ready all the time because teams now depend on staging to work before they can release to prod. In addition, since these environments are not identical, you do not gain confidence that the change will work in production, meaning that this also doubles the effort to check the system after its change for correctness.

For GDPR reasons, we cannot use customer data for this testing environment, which adds additional work because teams must provide clean test data (this is a minor issue and affects mostly account-related features).

Instead of using staging environments, lets consider what AWS is doing: they provide their products (e.g. DynamoDB) in a way that it can be deployed in isolation (if you need a testing environment you create a new account, and deploy a new DB). We could apply the same model: each service is packaged in a way that enables each team to deploy its own instance of this service, so they can run their integration tests against it.
