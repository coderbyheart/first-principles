\newpage

# Go serverless

Going serverless allows me and a rather small team of engineers to build a globally scalable software solution with a very high confidence in it's scalability and an ease of mind during operations. In the last years since I have been working fully serverless, I have not once experienced a surprising event that impacted our production system. Yes, we experience issues which gradually become more serious over time, but in general it happens in a way that does not interfere with my vacation plans.

Serverless not only enables horizontal scalability, but allows to update each component of the solution individually: the code for a lambda function can be replaced without affecting other functions. This means no more waiting minutes for a monolithic container to come up again after a fix has been deployed.

There are downsides:

- Being a quality fanatic, testing cloud-native solutions really is a challenge. You can see my talk about that topic here [^e2e-talk]
- In general, there is more ceremony involved in getting a development environment running, compared to a LAMP/MAMP stack based solution which a developer can run locally.
- It is a huge mindset shift from the classical application server model (LAMP, Tomcat, Rails), to a serverless, stateless, eventual consistent application development model, which you need to embrace and handle in the entire stack, when you want to optimize for scalability.

## Literature

- Martin Fowler, Mike Roberts: Serverless Architecture  
  <https://martinfowler.com/articles/serverless.html>
