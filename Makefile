all: gut-feelings-first-principles-of-a-software-crafter-markus-tacker.pdf gut-feelings-first-principles-of-a-software-crafter-markus-tacker.epub

gut-feelings-first-principles-of-a-software-crafter-markus-tacker.epub: Makefile book/*.md book/*.txt book/media/* book/*.css
	pandoc \
		-o $@ \
		--css=book/styles.css --standalone \
		book/title.txt \
		book/cover.md \
		book/about.md \
		book/how-to-share-a-gut-feeling.md \
		book/privilege.md \
		book/five-whys.md \
		book/push-to-deploy.md \
		book/20-percent-rule.md \
		book/build-prototypes-instead-of-calling-a-meeting.md \
		book/Have-a-force-ranked-list-of-things-to-work-on.md \
        book/wishful-thinking.md \
		book/Ubiquitous-Language.md \
        book/walking-skeleton.md \
		book/TDD.md \
		book/zero-bug-policy.md \
		book/Event-Sourcing.md \
		book/CQRS.md \
		book/Hexagonal-Architecture.md \
		book/12-factor-app.md \
		book/Reproducible-Builds.md \
		book/No-monorepos.md \
		book/Short-lived-branches.md \
		book/Go-serverless.md \
		book/Use-TypeScript.md \
		book/Readable-Error-Messages.md \
		book/Do-not-proxy-Third-Party-RESTful-APIs.md \
		book/All-code-styleguides-must-be-enforceable-by-tools.md \
		book/Flow-with-the-dependencies.md \
		book/pre-written-meeting-minutes.md \
		book/Leadership.md \
		book/Books.md \
		book/Videos.md \
		book/acknowledgements.md \
		book/Refs.md

gut-feelings-first-principles-of-a-software-crafter-markus-tacker.pdf: Makefile book/*.md book/*.txt book/media/*
	pandoc \
		-o $@ \
		--pdf-engine=xelatex \
		book/title.txt \
		book/cover.md \
		book/about.md \
		book/how-to-share-a-gut-feeling.md \
		book/privilege.md \
		book/five-whys.md \
		book/push-to-deploy.md \
		book/20-percent-rule.md \
		book/build-prototypes-instead-of-calling-a-meeting.md \
		book/Have-a-force-ranked-list-of-things-to-work-on.md \
        book/wishful-thinking.md \
		book/Ubiquitous-Language.md \
        book/walking-skeleton.md \
		book/TDD.md \
		book/zero-bug-policy.md \
		book/Event-Sourcing.md \
		book/CQRS.md \
		book/Hexagonal-Architecture.md \
		book/12-factor-app.md \
		book/Reproducible-Builds.md \
		book/No-monorepos.md \
		book/Short-lived-branches.md \
		book/Go-serverless.md \
		book/Use-TypeScript.md \
		book/Readable-Error-Messages.md \
		book/Do-not-proxy-Third-Party-RESTful-APIs.md \
		book/All-code-styleguides-must-be-enforceable-by-tools.md \
		book/Flow-with-the-dependencies.md \
		book/pre-written-meeting-minutes.md \
		book/Leadership.md \
		book/Books.md \
		book/Videos.md \
		book/acknowledgements.md \
		book/Refs.md
