all: gut-feelings-first-principles-of-a-software-crafter-markus-tacker.pdf gut-feelings-first-principles-of-a-software-crafter-markus-tacker.epub

gut-feelings-first-principles-of-a-software-crafter-markus-tacker.epub: Makefile book/*.md book/*.txt book/media/* book/*.css
	pandoc \
		-o $@ \
		--css=book/styles.css --standalone \
		book/title.txt \
		book/cover.md \
		book/about.md \
		book/software-craft.md \
		book/how-to-share-a-gut-feeling.md \
		book/privilege.md \
		book/Have-a-force-ranked-list-of-things-to-work-on.md \
		book/build-prototypes-instead-of-calling-a-meeting.md \
		book/20-percent-rule.md \
		book/five-whys.md \
		book/wishful-thinking.md \
		book/Ubiquitous-Language.md \
        book/walking-skeleton.md \
		book/Use-TypeScript.md \
		book/TDD.md \
		book/zero-bug-policy.md \
		book/push-to-deploy.md \
		book/semantic-release.md \
		book/Reproducible-Builds.md \
		book/Go-serverless.md \
		book/Event-Driven-Systems.md \
		book/CQRS.md \
		book/Hexagonal-Architecture.md \
		book/Run-your-infra.md \
		book/No-staging.md \
		book/No-monorepos.md \
		book/Short-lived-branches.md \
		book/All-code-styleguides-must-be-enforceable-by-tools.md \
		book/Flow-with-the-dependencies.md \
		book/Books.md \
		book/acknowledgements.md \
		book/Refs.md

gut-feelings-first-principles-of-a-software-crafter-markus-tacker.pdf: Makefile book/*.md book/*.txt book/media/*
	pandoc \
		-o $@ \
		--pdf-engine=xelatex \
		book/title.txt \
		book/cover.md \
		book/about.md \
		book/software-craft.md \
		book/how-to-share-a-gut-feeling.md \
		book/privilege.md \
		book/Have-a-force-ranked-list-of-things-to-work-on.md \
		book/build-prototypes-instead-of-calling-a-meeting.md \
		book/20-percent-rule.md \
		book/five-whys.md \
		book/wishful-thinking.md \
		book/Ubiquitous-Language.md \
        book/walking-skeleton.md \
		book/Use-TypeScript.md \
		book/TDD.md \
		book/zero-bug-policy.md \
		book/push-to-deploy.md \
		book/semantic-release.md \
		book/Reproducible-Builds.md \
		book/Go-serverless.md \
		book/Event-Driven-Systems.md \
		book/CQRS.md \
		book/Hexagonal-Architecture.md \
		book/Run-your-infra.md \
		book/No-staging.md \
		book/No-monorepos.md \
		book/Short-lived-branches.md \
		book/All-code-styleguides-must-be-enforceable-by-tools.md \
		book/Flow-with-the-dependencies.md \
		book/Books.md \
		book/acknowledgements.md \
		book/Refs.md
