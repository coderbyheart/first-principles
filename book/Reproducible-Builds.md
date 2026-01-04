# Reproducible builds

When packaging a [release](#semantic-release) for deployment and deploying it, it is important to ensure that the deployment is deterministic and can be repeated with the exact configuration that was deployed to production.

This is critical in order to be able to reproduce bugs in a development instance, but more importantly to recover from failures and enable horizontal scalability. When using serverless execution environments, horizontal scaling is solved for you. The key aspect is being able to reproduce the exact source code artefact that was used in production. And since we are pulling in hundreds of thousands of lines of code from dependencies that change at any given time of the day, it is important to commit your dependency managers lock file (`package-lock.json`, if you are using NPM [^package-lock]) of each project so that when a specific version of this project is checked out, the dependencies that are installed are also exactly the same.

## Resources

- Reproducible builds  
  <https://reproducible-builds.org/>
- The Twelve-Factor App  
  <https://12factor.net/>

[^package-lock]: <https://docs.npmjs.com/cli/v11/configuring-npm/package-lock-json>
