# Provisioning infrastructure

## AWS account and setup
- [] Create AWS account.
- [] AWS CLI.
- [] AWS SAM CLI?
- [] CloudFormation?

## VPC, Roles and Policies
- [] Create VPC.
- [] Create IAM roles.
- [] Create IAM policies.

## Create S3 Bucket for the backend and zip file
- [] Create S3 bucket
- [] Configure backend storage
- [] Store zip file in S3 using goto

## Lambda Function
- [] On the console, head over to AWS Lambda, create function, name it 'go-serverless-yt', set Go 1.x.
- [] Create a new role from AWS policy templates called 'go-serverless-yt-executor', 
- [] Policy: choose 'simple microservice permissions' from the templates. Create/
- [] On Runtime settings, change the handler to 'main'
- [] Upload the zip file to the function

## DynamoDB
- [] On DynamoDB, create a table called 'go-serverless-yt'
- [] Partition Key: email as string. Create.

## API Gateway
- [] On API Gateway, create API(build REST api): protocol is REST, create new API is New API, api name is go-serverless-yt. Create.
- [] On Actions, create method: ANY, integration type is lambda function, use lambda proxy integration, lambda region is us-east-1, lambda function is go-serverless-yt, use default timeout. Save.
- [] From actions, deploy API. Deployment stage: New Stage. Stage name: staging. Deploy.

# Test API
- [] Test URL: https://go-serverless-yt-staging.execute-api.us-east-1.amazonaws.com/staging/
  - POST: curl --header "Content-Type: application/json" --request POST --data '{"email": "kaiotest@gmail.com", firstName: "Kaio", lastName: "Cunha"}' [https://go-serverless-yt-staging.execute-api.us-east-1.amazonaws.com/staging/
  - GET: curl -X GET https://go-serverless-yt-staging.execute-api.us-east-1.amazonaws.com/staging/
  - GET: curl -X GET https://go-serverless-yt-staging.execute-api.us-east-1.amazonaws.com/staging\?email\=kaiotest@gmail.com
  - PUT: curl -X PUT --header "Content-Type: application/json" --request PUT --data '{"email": "kaiotest@gmail.com", firstName: "Kaio Henrique", lastName: "Cunha"}' https://go-serverless-yt-staging.execute-api.us-east-1.amazonaws.com/staging/
  - DELETE: curl -X DELETE https://go-serverless-yt-staging.execute-api.us-east-1.amazonaws.com/staging\?email\=kaiotest@gmail.com