# Nittfest-App

Mobile Application for NITTFEST.

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
    ./run.sh .env
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
      
## Firebase

### Requirements
- [gnupg](https://gnupg.org/download/)

### Setup
* Add google-services.json file inside android/app/
* Add the file path in .gitignore(if not already)
* Creating tar file [services.tar], Run the command below in your project's working directory to create the archive file:
    
    ``` 
    tar cvf services.tar android/app/google-services.json
    ```
* Add the services.tar in .gitignore(if not already)
* Run the command below to encrypt the services.tar file. 
    ``` 
    gpg -c services.tar
    ```
* During encryption, it will ask for password which will be used to decrypt the encrypted file. After running the command, there will be a new file in your project's working directory named `services.tar.gpg`.    
* Add the gpg password to github secrets    

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
