\newpage

# Embracing Controlled Experimentation in Software Projects to Continuously Keep Learning

_How I keep up to date with the latest tech_

In the fast‑moving world of software development, the temptation to rely on familiar patterns is strong. Repeating the same architecture, the same stack, and the same deployment pipeline can feel safe, but it also stalls growth. True progress comes from deliberately stepping outside the comfort zone—yet doing so without jeopardizing delivery. I have used a pragmatic approach to “wild‑card” experimentation that lets you learn new technologies while keeping project risk low.

When a developer reaches a point where every task feels like a rehearsal, two things happen: little to no new knowledge is gained and improvements are marginal; breakthroughs are rare. Repeating a solution twice may polish execution, but it rarely produces a leap in capability. The challenge, then, is to inject novelty without sacrificing the deadline.

The core idea is simple: reserve a single, bounded experiment in each project. Treat it as a controlled variable in an otherwise stable system. Here’s how it works in practice.

In a bigger project, I pick one aspect that I would like to implement using a technology that I am not familiar with, for example using event sourcing, where I have limited experience, instead of CRUD, which I have used for the last ten projects.

A practical rule of thumb is to aim for no more than a 20 % increase in overall project risk. This figure accounts for the extra time needed to integrate, test, and possibly roll back the experiment.

This means that if my experiment fails, I can fall back to the well know implementation and finish the project with maybe a little bit of overtime. But it does not jeopardize the success of the entire project.

Repeatedly applying the same solution yields diminishing returns. By deliberately inserting a single, well‑contained experiment into each project, you create a learning loop that fuels personal growth and technical evolution while keeping delivery risk manageable. The “one wild card” approach transforms every codebase into a laboratory—one where failures are safe, successes are celebrated, and the next breakthrough is always just around the corner.

## Practical Guidelines for Your Next Project

- Identify the “wild‑card” early – During sprint planning, earmark a component that could be implemented using a new way.
- Allocate time for experimentation – Deliberately reserve 20% of the sprint for reading docs, prototyping, and debugging.
- Pay close attention – Make sure to meticulously observe if you are coding yourself in a corner and make sure to abort the experiment early enough to not jeopardize the project success.
- Share the findings – Conduct a brief post‑mortem or demo session so the whole team benefits from the knowledge gained.
