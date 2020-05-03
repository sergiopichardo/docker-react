# Docker React 

[![Build Status](https://travis-ci.com/sergiopichardo/docker-react.svg?branch=master)](https://travis-ci.com/sergiopichardo/docker-react)

Setting up Continuous Integration/Deployment with TravisCI (for learning purposes)


### Install Elastic Beanstalk CLI 
```sh
$ brew install awsebcli
```

### Create a new IAM user
```sh
$ aws iam create-user --user-name <the_name_of_your_user>
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


## Instructions for Travis CI setup
<Will go here>