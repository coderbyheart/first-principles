gut-feeling.pdf: Makefile *.md *.txt ./media/*
	pandoc \
		--pdf-engine=xelatex \
		--from markdown+tex_math_dollars+header_attributes \
		-o $@ \
		title.txt \
		cover.md \
		about.md \
		how-to-share-a-gut-feeling.md \
		privilege.md \
		five-whys.md \
		push-to-deploy.md \
		20-percent-rule.md \
		build-prototypes-instead-of-calling-a-meeting.md \
        wishful-thinking.md \
        walking-skeleton.md \
		zero-bug-policy.md \
		end.md