# Zero Bug Policy {#zero-bug-policy}

I don't like technical debt, and bugs are a special kind of technical debt.

In the projects I work on, we usually establish an _Zero Bug Policy_, which means that any defect needs to be fixed immediately. That means that as soon as a bug is reported, we aim to triage it quickly, verify that it is indeed a bug, and then fix it. This gives bugs priority over regular work, as long as they’re important enough.

In front‑end apps there can be browser‑specific bugs that affect only a small number of users. For those cases I apply a 3 % rule:

Does the bug affect 3 % or more of the users?

 - If yes, it is important and should be fixed.

 - If not, it can be postponed or, if it is not worth it, we may decide not to fix it at all.

In any code-base, despite thorough testing (unit, integration, and end‑to‑end tests), bugs will always appear—they cannot be avoided. In my experience, when a system is well‑tested and continuously deployed, fixing a bug is straightforward. Usually the problem is clear, even if the exact fix is not. You can write a failing test that captures the issue, then implement the fix.

Documenting the bug in a tracker and adding it to a sprint can feel like a lot of overhead. I prefer letting developers fix the bug first and then record it afterward in the sprint log. Once fixed, the change can be rolled out immediately because the behavior is unexpected, and we already know the expected outcome—no lengthy ceremony is needed as with a new feature release. After all a bug-fix restores the system to the intended state.

The main reason for this approach is to prevent a growing list of bugs, because maintining this list is usually more work than fixing the issue right away. Frequent interruptions for bug fixing signal that overall quality of the project is not where it should be. It is essentially a form of dogfooding—testing our own delivery speed. If your processes ensure high‑quality software, you’ll encounter fewer bugs. Otherwise, you’ll see more interruptions during feature work, indicating that quality needs improvement.

A zero‑bug policy also depends on being able to ship changes quickly. Your deployment pipeline must allow a bug‑fix change to reach production rapidly. Regularly exercising this process proves that the end‑to‑end deployment pipeline is reliable.

Most bugs are discovered by users, not developers. When a user finds a bug, fixing it quickly makes them happier. Therefore, it is important to state explicitly in a project that you aim for zero open bugs, and to track all bugs—including those that won’t be fixed because they fall under agreed‑upon criteria (e.g., unsupported browsers or operating systems).

This principle applies regardless of how you release software. Even if a bug is reported for an older version, you shouldn’t postpone fixing it; address it now and include it in the next release. There’s no reason this approach can only work in continuously deployed projects.
