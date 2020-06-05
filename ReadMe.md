# AWS BOOTSTRAP

A guide to deploying a simple web application to AWS. Touching each AWS infrastructure step by step by step.

## Objective

Get a simple web application running on a single EC2 instance

## Steps

- Write a basic "hello world"  web application.
- This is a very simple node.js application that displays "Hello World!" in the browser.
- It requires that node.js, git and npm to already be installed.

### Creating the application

- From the console, type `mkdir aws-bootstrap && cd aws-bootstrap`. This creates a new aws-bootstrap folder and change directory to that folder.
- initialize the project as a git repo `git init`
- create a package.json file to manage dependencies `npm init -y`.
- create a server.js file to hold the application code `touch server.js`. 
- write a simple node app that listen for HTTP requests on a chosen port and respond with "Hello World". See server.js file.
