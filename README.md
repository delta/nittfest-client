# Nittfest-Client

Client Application for NITTFEST.

<p align="center"><img src="https://user-images.githubusercontent.com/63253383/146638088-96d83626-f121-46fc-9f7d-208b0f9fe725.png"></p>

## Flutter

### Requirements

- Java-Version - '12.x'
- Flutter-Version - '2.8.x'
- Dart-Version - '2.12' or above
- Android Studio

### Setup
* Fork and Clone the Repo
    ```
    git clone <YOUR_FORK_URL>
    ```
* Add remote upstream
    ```
    git remote add upstream <MAIN_REPO_URL>
    ```
* To get all the dependencies listed in the pubspec
    ```
    flutter pub get
    ```
* To run the App
    ```
    flutter run 
    ```
### Architecture 
MVC architecture using GetX
  * `Model` refers to all the data and its related logic.
  * `View` Present data to the user or handles user interaction 
    * Implemented using GetView/GetResponsiveView 
    * GetView is a constant statelessWidget, usually associated with a GetXController
    * GetResponsiveView is a screen-width depended widget associated with a GetXController and used in case of responsive UI design.
  * `Controller` refers to an interface between Model and View components 
    * Implemented using GetXController.
    * Consists of 3 life cycles.
      * onInit() : called when controller’s memory allocated
      * onReady() : called upon UI widgets appearing on screen
      * onClose() : called before the controller gets deleted from the memory
      
## GithubActions

### Workflow
* on: [pull_request, push] to main: This workflow will work whenever someone push or, make a pull request main branch.
* In the steps we are:
   * if pull_request
        * Run Formatter
        * Run Analyzer
   * if push
        * generates apk
        
## GitHooks

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

## Contributing to Nittfest-Client

Here are the guidelines we'd like you to follow:

- [Coding Rules](#rules)
- [Commit Message Guidelines](#commit)

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
