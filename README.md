# Docker React 

[![Build Status](https://travis-ci.com/sergiopichardo/docker-react.svg?branch=master)](https://travis-ci.com/sergiopichardo/docker-react)

Setting up Continuous Integration/Deployment with TravisCI (for learning purposes)


### Install Elastic Beanstalk CLI 
```sh
$ brew install awsebcli
```

### Create a new IAM user
1. Go to the AWS console and search for IAM 
2. Create a new user with programmatic access 
3. Attach this policy `AWSElasticBeanstalkFullAccess`
4. Download your `credentials.csv` file

## Instructions for Travis CI setup
After you have setup your IAM user, you must add 2 environment 
variables using the TravisCI user interface. You'll gain access
to the environment variables page by clicking on the settings 
icon of your current project being run by TravisCI. 

### Your AWS Access Key Id 
```sh
AWS_ACCESS_KEY_ID=AWOEI2EXAMPLEGHAS0ASFJW039J
```

### Your AWS Secret Access KEy
```sh
AWS_SECRET_ACCESS_KEY=A0LASDExAmPl3FXXXJ2FJALKfj309WJF939239XX
```


### Create an elastic beanstalk app
Initializes your directory with the EB CLI. Creates the application.
```sh
$ eb init
```

Also add the following code inside your .elasticbeanstalk/config.yml
```yml
branch-defaults:
  deploy:
    artifact: ./www/Archive.zip
  master:
    environment: <your_app_name_environment_name>
    group_suffix: null
global:
  application_name: <your_app_name>
  branch: null
  default_ec2_keyname: null
  default_platform: Docker
  default_region: <your_aws_region>
  include_git_submodules: true
  instance_profile: null
  platform_name: null
  platform_version: null
  profile: null
  repository: null
  sc: git
  workspace_type: Application
```


### Create a new elastic beanstalk environment
```sh
$ eb create
```

### Deploy your code into the elastic beanstalk environment
```sh 
$ eb deploy
```


### Instructions to run this project 
<Will go here>


### File descriptions 
<Will go here>



