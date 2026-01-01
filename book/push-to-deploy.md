\newpage

# Push to deploy {#push-to-deploy}

_The way to move quickly is to focus on adding value, not packaging it._

My most blissful hours as a software engineer are those where I can
uninterruptedly focus on an implementation task. It's a _joyful_ state of mind,
which is called _The Zone_, and it means for me to be able to concentrate for a
prolonged time on a specific detail or problem. This phase is then concluded,
when the feature is complete, the tests are green and the changes are pushed to
the repository. I can now make a coffee and think about the next _new thing_ to
work on.

What I don't want is to spend time waiting for my change to be deployed, or
worse deploy them manually. This involves boring, tedious, repetitive steps
which have to be executed in a specific order. Computers are great at this, they
have an unlimited amount of patience and are perfect at executing instructions
in a given order.

Automating deployment processes implictly creates _living documentation_ of the
systems needed to put changes in front of consumers, and therefore adds
resilience to any software project. The instructions how to deploy the project
are always up to date, because they _do_ the deployment.

I spent a significant amount of time in enabling and maintaining deployments,
however in my experience is this time wisely invested in times where I could
plan it, and allowes me to move fast in times of crisis.

_Push to deploy_ requires _confidence to deploy_. This confidence is created by
using techniques like test-driven-development, end-to-end testing, static code
analysis and others to ensure that run-time defects to not happen often and that
a change. Those are first-principles in their own right which I will focus in
later posts.

## busFactor = $∞$

Push to deploy is a way to increase the
bus factor[^bus-factor] significantly. It allows
me to go on vacation. By actively moving knowledge into code, I also enable
colleagues to learn _how_ things are done and work together.

For me this is one of the main principles I apply every day, because it enables
me to move fast, and with confidence.

## Literature

- The SPACE of Developer Productivity  
  <https://queue.acm.org/detail.cfm?id=3454124>
- ACCELERATE &mdash; The Science of Lean Software and DevOps: Building and Scaling High Performing Technology Organizations  
  <https://itrevolution.com/book/accelerate/>
- Charity Majors: It is time to fulfill the promise of CI/CD  
  <https://speakerdeck.com/charity/cd>
- Continuous integration vs. continuous delivery vs. continuous deployment  
  <https://www.atlassian.com/continuous-delivery/principles/continuous-integration-vs-delivery-vs-deployment>
- Reproducible Builds  
  <https://reproducible-builds.org/>
- GitOps  
  <https://www.gitops.tech/>

[^bus-factor]: <https://en.wikipedia.org/wiki/Bus_factor>
