# Use semantic-release to automate release creation {#semantic-release}

In the previous chapter I wrote about the need to continuously deploy the project.

I use _semantic release_ [^semantic-release] to automatically create releases based on the commit messages in the project. Using certain keywords in the commit messages to determine the severity of a change, whether it is a fix, and feature or a breaking change, the semantic version (_semver_) [^semver] is increased and used to create a new release in the repository of the project. This works fully automated and removes the need to manually write release notes.

## When you have continuous releases of software—multiple times per day—what is the point of having a semantic version?

Releases are not necessary, especially in a SaaS product which is delivered through the users web browser. They do not have to buy a specific version of the software and install it.

In the end, it comes down to being able to identify a specific version of a system; that is the _semver_ aspect.

Yes, there is a hash attached to each commit, which technically identifies the version of the software, but having a more human‑readable identifier for a point in time when the software was deployed is helpful. This version gets attached to bug reports, for example in Sentry, so we know which version was affected, or attached to support emails generated from feedback forms. It is a more natural way to understand the state of the software in time. Commit hashes are random, so you can’t tell if hash `2bb1fbe8d6efeb423b450824d6ba545dbb0330da` was before or after hash `caf6d49ba8cf317ca25b7f56958187dc1b58635e` just by looking at them. A semantic version makes it clear which version came after another: `1.0.11` comes before `2.1.0`.

A semantic version consists of three components: major, minor, and patch. The change in the _semver_ from one release to another conveys the significance of the change. This helps every stakeholder understand how big the latest change was.

- If only the patch version increases, everyone knows there’s no new feature; it removes a defect in the software. In semantic release this is expressed using the `fix` keyword at the start of the first line of the commit message.

- If the minor version increases, we know there’s a new capability that may need documentation, and users can expect something new. In semantic release this is expressed using the `feat` keyword at the start of the first line of the commit message.

- If the major version increases, it signals a breaking change—something that could require work for anyone using the package.
  Breaking changes are especially important for library or protocol projects, as discussed in the [TypeScript chapter](#typescript). For example, moving from version 4 to 5 clearly indicates that users should anticipate work related to that specific change. In semantic release this is expressed using the `feat` keyword at the start of the first line of the commit message with a line starting with `BREAKING CHANGE` in the commit message body.

In short, semantic versioning is a way to communicate the severity and impact of changes. That’s why I still like having releases in my software projects.

[^semantic-release]: <https://github.com/semantic-release/semantic-release>

[^semver]: <https://semver.org/>
