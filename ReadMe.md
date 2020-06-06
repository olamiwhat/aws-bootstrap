# AWS BOOTSTRAP

A guide to deploying a simple web application to AWS. Touching each AWS infrastructure step by step.

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
- use a process manager to monitor the application so that it automatically restarts if it crashes. `npm install pm2@latest --save-D`.
- modify package.json to use `npm start` to start application, use pm2 to monitor app under the "hello_aws" and send its stdout to "../logs/app.log"
    `"start": "node ./node_modules/pm2/bin/pm2 start server.js --name hello_aws --log ../logs/app.log`
- create a log directory outside the application directory where the application logs will be sent to.
- add a stop script to stop tha application
    `"stop": node ./node_modules/pm2/bin/pm2 stop`
- add a build step to package.json - Here I am using a dummy build step (Production build process actually goes here)
    `"build": "echo 'Building....'"`.

### Manual Installation of AWS Infrastructure

This step is to manually create a basic AWS infrastructure to host the application. Manually install the application on an EC2 instance. Note that you need to have an AWS account for the following steps.

- Visit the AWS console and select any region.
- Go to the EC2 instances section of the AWS and hit the "Launch Instance" button.
- You'll be asked to pick an AMI(Amazon Machine Image, which is basically a set of instructions for installing the operating system and some associated software). Select default "Amazon Linux 2 AMI on x86".
- Next, choose an instance type - the default t2.micro, which is within the AWS free tier.
- Keep accepting default until you're asked to configure the security group. Add a rule to allow traffic to port 8080, which we configure our application to listen on.
- Hit the "Review and Launch" buttons to get the instance started. Select Proceed without a key pair and then Launch instance.
- The instance can be reached on the internet via the Public DNS (IPv4) shown in the console.

### Running Application

- ssh into the instance using the EC2 connect (browser-based SSH connection).
- update the installed packages - `sudo yum -y update`
- install node
- download the application from github and save in a directory "aws-bootstrap-master"
- create a log directory
- cd into the "aws-bootstrap-master" directory
- run `npm install`
- run `npm start`
- `curl http://<public_dns>:8080` to send a request to the application. The public dns can be found on the instance page.
