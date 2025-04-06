# Entry Tracker

## Description 
This repo contains a basic CI/CD pipeline implementation for building, testing, publising and deploying a python flask application that tracks app client entries
and logs them in a MySQL database. 

Application is deployed on an AWS EC2 instance ☁️,  
click [here](http://ec2-3-108-42-106.ap-south-1.compute.amazonaws.com:5000/) to try it for your self. 

The CI includes the following tests - 
* **_Unit Tests_** for setting a python environment, installing dependencies & running the application.
* **_Integration Tests_** that includes build the application's docker image, deploying it with docker-compose along it's pre-requisite MySQL service, and validating the DB connection is successfull.

These are required for merging/pushing any change to the repositories main branch.
Once these validations complete successfully and the changes are merged (pushed) into the main branch, 
The CI pipeline continues with publishing the latest image to it's [corresponding Elastic Container Registry (ECR)](https://ap-south-1.console.aws.amazon.com/ecr/repositories/public/216989112318/develeap/entry-tracker?region=ap-south-1) on AWS, and then this new images is deployed to the EC2 Webserver which restarts the application with up-to-date image version. 
