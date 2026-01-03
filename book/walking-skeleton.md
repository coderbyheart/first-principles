\newpage

# Walking Skeleton {#sec:walking-skeleton}

This is the first _working_ implementation after the initial design was created using _Wishful Thinking_ as described in [chapter @sec:wishful-thinking] and is continuously deployed as described in [chapter @sec:push-to-deploy]: _Push to Deploy_. It is a useful mental model also found in the lean software development movement, that I use as a mantra: always leave the software in a working, deployed state so it can create value.

For me, “working software” isn’t just about correct business‑rule implementations. It means the entire application is live, deployable, and observable. That includes the CI/CD pipeline, hosting environment, and all supporting infrastructure. By treating the initial artifact as a production‑ready deployment, I gain immediate visibility into the real‑world constraints of the system.

My typical approach begins with the simplest possible feature—often a single endpoint that returns static data. I commit this code to a GitHub repository and configure a continuous‑deployment workflow that pushes the build to its own AWS account. From day one, the code lives in a production‑like environment, reachable via a preview URL or generated domain name. Even though the first iteration looks terrible—no polished UI, no authentication, perhaps even placeholder data—it serves a crucial purpose: a tangible artifact that stakeholders can explore and comment on. I can share the state of the work with product owners, designers, and other stakeholders and ask, “Does this direction meet your expectations?” Their feedback arrives daily, or at their convenience, not weeks later.

Maintaining a constantly releasable state aligns perfectly with trunk‑based development (see [chapter @sec:trunk-based-development]). Because the main branch is always deployable, I can pause any feature work, switch to work on other projects without worrying about code rot. Automation is the lifeblood of a walking skeleton. Once the CI/CD pipeline is in place, dependency updates, security patches, and library upgrades flow through automatically. I don’t need to manually intervene to keep the software up‑to‑date; the pipeline pulls the latest versions, runs the test suite, and redeploys if everything passes. This self‑maintaining loop ensures the skeleton remains stable and secure over time.

One of the biggest lessons I’ve learned is that integration work is the hardest part. If you postpone wiring together the database, API layer, authentication, logging, and deployment scripts until later, you’ll face a massive, error‑prone effort when the time finally comes.

Even if the early skeleton receives no real customer traffic, I treat it as a production environment. When I write a database migration, I execute it against the live instance. When I modify an API contract, I validate it against the deployed service. This habit forces me to think about operational concerns—such as monitoring, scaling, and security—from the outset. By pulling every component into the skeleton from day one, I quickly discover whether the chosen technologies play nicely together. For example, when I spin up a production‑like PostgreSQL instance and run a migration script, I instantly see if the migration process works in the real environment—not just in a local dev setup. The same applies to API contracts, authentication flows, and observability tooling.

It’s tempting to defer critical pieces like authentication, assuming they can be bolted on later. However, without authentication, a publicly accessible skeleton can expose sensitive business logic or data. Moreover, retrofitting authentication often uncovers hidden dependencies that ripple through the codebase. By including even a minimal auth mechanism early (for example, a simple token‑based guard), I ensure the skeleton can be safely exposed to external reviewers and, eventually, real users.

A walking skeleton doesn’t promise a polished product on day one—it promises a shippable, runnable slice of the final system. Because the core architecture, deployment pipeline, and integration points are already in place, extending the skeleton with new features becomes a matter of incremental additions rather than massive rewrites.

When the time comes to launch the full product, the transition from “walking skeleton” to “complete solution” is smooth. Most of the heavy lifting—continuous deployment, environment provisioning, integration testing—is already done. Adding value then becomes a matter of building out the remaining features, refining the UI, and polishing the user experience.

It also happens more often than not, that priorities change and we need to stop working on this project. And if you don't have essential aspects like authentication, which could be easily considered as only needed for the production roll-out and added as one of the last aspects, then you cannot actually put this state into production. You may have a working piece of software that can manage your business logic, but without authentication, you cannot deploy it for customers. But if you have an end-to-end implemented piece of software and that implements at least some of the features that were required, there might be just a small effort needed to get it out into production and start producing value.

_Walking Skeletons_ reduce the likelyhood of your project not delivering value.

## Literature

- <https://wiki.c2.com/?WalkingSkeleton>
- Kickstart Your Next Project with a Walking Skeleton  
  <https://codeclimate.com/blog/kickstart-your-next-project-with-a-walking-skeleton/>
- Lean Mindset by Mary and Tom Poppendieck  
  <https://coderbyheart.com/lean-mindset>
