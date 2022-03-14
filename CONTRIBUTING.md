## Contributing to Nittfest-App

Here are the guidelines we'd like you to follow:

- [Coding Rules](#rules)
- [Commit Message Guidelines](#commit)

---
**Github:**

### Workflow
* on: [pull_request, push] to main: This workflow will work whenever someone push or, make a pull request main branch.
* In the steps we are:
   * if pull_request
        * Run Formatter
        * Run Analyzer
   * if push
        * generates apk

### GitHooks

### Configure git-hooks path
* Run the following command
    ```
    git config core.hooksPath .githooks
    ```
 ### Features 
* pre-commit
    * Runs Formatter
    * Runs Analyzer

* pre-push
    * Checks for un-committed files
    * Runs Test cases
---
**NOTE:**

Never push directly to main repository (upstream). Only push to your forked repo (origin) and send a pull request to
the main repository

---

### <a id="rules"></a> Coding Rules

To ensure consistency throughout the source code, keep these rules in mind as you are working:

- The coding style to be followed along with instructions to use flutter_lint
- Enable `sound-null-safety`

### <a id="commit"></a> Git Commit Guidelines

#### Commit Message Format

Each commit message consists of a **header**, a **body** and a **footer**. The header has a special
format that includes a **type**, a **scope** and a **subject**:

```bash
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

Any line of the commit message cannot be longer 100 characters! This allows the message to be easier to read on github
as well as in various git tools.

#### Example Commit Message

```bash
feat(MainPage): Implement rive animations to MainPage

In this PR,
* rive assets are added.
* rive animations are handled in getx controller

```

Please follow the conventions followed [here](http://karma-runner.github.io/latest/dev/git-commit-msg.html).

Also, refer [this page](https://chris.beams.io/posts/git-commit/) on how to write the body
