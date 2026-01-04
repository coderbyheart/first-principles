# All code style guides must be enforceable by tools

If there is no tool to fix a style issue, then I won't enforce the rule.

It's important to have an automated way of formatting source code to eliminate discussions around style and remove noise from diffs.

The best way to handle it is to fix all fixable errors using _lint-staged_ [^lint-staged] and _Prettier_ [^prettier]. That way developers won't even notice. Good IDEs are able to apply prettier style guides automatically even during editing.

[^lint-staged]: <https://github.com/okonet/lint-staged>

[^prettier]: <https://prettier.io/>
