# Go serverless

When AWS release Lambda in 2014, I was immediately hooked. Since then I have been working more or less exclusively in serverless architectures. They allow me and a rather small team of engineers to build a software solution with a very high confidence in it's global scalability and an ease of mind during operations. In the last years since I have been working fully serverless, I have not once experienced a surprising event that impacted our production system. Yes, we experience issues which gradually become more serious over time, but in general it happens in a way that does not interfere with my vacation plans.

It is my preferred architecture style, and has decively shaped the way I design systems, which I will outline more in detail in the follow chapters.

## What Is Serverless?

Serverless as an architecture or application design that uses managed, ephemeral containers and runs on a Function‑as‑a‑Service (FaaS) platform. In short, you don’t have to think about individual computers any more—you deploy a function, it runs, you get a result, and the platform handles the execution.

The benefit is that you no longer have to manage the whole infrastructure. You don’t need to order a metal box, rack it in a data center, pay for space, or keep track of how many machines you have. Computation becomes a commodity, allowing you to focus on the business value of your solution and write code that is specific to your product or domain, without caring where or how it runs. All you need is reliable execution.

## Why I Like Serverless

I first encountered serverless around 2012‑2013 when I started working with AWS. The convenience was obvious: I didn’t have to manage machines, so I could concentrate on solving my customers’ problems. Specialists could handle the hardware, data‑center operations, and security, leaving me free to rely on giants like Amazon, Google, or Microsoft for resources that are virtually always available.

This reliability lets me develop solutions and even take vacations without worrying about downtime. As long as the code is correct, the platform will scale automatically and won’t crash.

However, serverless isn’t suitable for everyone. It locks you into a specific vendor and often relies on proprietary, non‑open‑source technologies. Legal or privacy requirements may force you to run your own infrastructure, and there are very few proven open‑source equivalents, making adoption harder.

## Horizontal Scalability

Serverless providers have automated the provisioning of resources needed to run arbitrary code. The contract is essentially: “Here are some inputs and some code—run it.” Because this process is generalized, providers can repeatedly allocate resources, making scaling effortless. If you design your code to run in parallel, you gain scalability for free.

The trade‑off is eventual consistency. Splitting computation into parallel executions distributes your data, so you must design your solution carefully to handle non‑atomic data access and adjust how you implement user‑facing features.

## Updating Individual Components

Traditional monolithic deployments involve a single large JAR deployed on an Apache Tomcat server. Any change requires redeploying the whole JAR and often rebooting the application server, leading to maintenance windows (“We’ll reboot Saturday at 3 am”). [^outdated]

With serverless, the application is broken into hundreds of individual functions that can be updated independently. You can push micro‑updates throughout the day without downtime. If a function fails, only that small component is affected—not the entire service.

## Infrastructure Becomes Part of the Solution

While you no longer manage physical hardware, you must still specify the resources your function needs: RAM, network connectivity, database schemas, indexes, etc. This makes infrastructure explicit and declarative, improving documentation but increasing the learning curve. Mistakes in configuration can require a restart, though the cloud provider’s patience means you only waste your own time, not a colleague’s.

In general, there is more ceremony involved in getting a development environment running, compared to a LAMP/MAMP stack based solution which a developer can run locally.

## Downsides of Serverless: Testability

Testing serverless solutions is challenging. In a traditional setup, you can run the entire stack locally—database, web server, and application—allowing easy mocking, inspection, and tracing. Serverless services, however, are composed of multiple managed components (load balancers, sharded databases, message buses) that cannot be run on a single machine. This forces developers to adopt new testing strategies and mindsets, as many conventional techniques no longer apply. You can see my talk about that topic here [^e2e-talk]

## Serverless Is Usually Closed Source

Most serverless offerings are proprietary. For example, Amazon DynamoDB is a classic serverless service; DynamoDB Local provides a compatible API but does not replicate the cloud’s behavior or scalability. Vendor lock‑in is a real concern, although the core business logic (often JavaScript) can be portable across providers. Multi‑cloud deployments are rare and typically reserved for organizations with sufficient resources (e.g., banks) to duplicate code across clouds.

## Mindset Shift

The biggest challenge is the mindset shift. You must abandon familiar practices such as running a local web server, managing networking, and orchestrating services. Instead, you decompose a monolith into many small functions (micro‑services) and embrace a new architectural paradigm. This transition is often the most demanding part of adopting serverless.

## Resources

- My talk about Serverless Architecture for IoT on AWS  
  <https://www.youtube.com/watch?v=E7t6BXGIZHk>
- Martin Fowler, Mike Roberts: Serverless Architecture  
  <https://martinfowler.com/articles/serverless.html>

[^outdated]: I told you, my experience with containerized applications services is outdate by more than ten years!
