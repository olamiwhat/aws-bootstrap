#!/bin/bash

# A stack is what CloudFormation calls the collection of resources that are managed together as a unit.
# The stack name is the name that CloudFormation will use to refer to the group of resources it will manage.
STACK_NAME=awsbootstrap

# The regio to deploy to
REGION=us-east-1

# using the profile that was already created
CLI_PROFILE=awsbootstrap

# An instance type in the free tier
EC2_INSTANCE_TYPE=t2.micro 

# Deploy the CloudFormation template
echo -e "\n\n=========== Deploying main.yml ==========="
aws cloudformation deploy \
  --region $REGION \
  --profile $CLI_PROFILE \
  --stack-name $STACK_NAME \
  --template-file main.yml \ # This is the Cloud Formation template use to define the infrastrucure
  --no-fail-on-empty-changeset \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides \ 
    EC2InstanceType=$EC2_INSTANCE_TYPE