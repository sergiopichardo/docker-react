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

## Initial Elastic Beanstalk Setup

### Create an elastic beanstalk app
Initializes your directory with the EB CLI. Creates the application.
We don't really need this command b/c there's a an elastic beanstalk `config.yml` file.
```sh
$ eb init
```

Add the following code inside your .elasticbeanstalk/config.yml
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

### Choose your environment 
```
$ eb use <your_environment_name>
```

### Deploy your code into the elastic beanstalk environment
```sh 
$ eb deploy
```

### Testing Travis 
Allow integration only on the `master` branch. 
To check this works: 

#### 1. Create a new branch called `feature` and switch to it.

```sh
$ git checkout -b feature
```

#### 2. Push the branch to remote and see if travis deploys your code.
```sh
$ git push origin feature
```

#### 3. Checkout master 
```sh
$ git checkout master 
```

#### 4. Create pull request: `master` <-- feature (In GitHub)
Wait until all tests are run by TravisCI and pass successfully

#### 5. Merge changes to master (In Github)
Click on `Merge pull request`, and click `Confirm merge`.
- Travis will now deploy code from master branch into production 
using Elastic Beanstalk

#### 6. Pull for changes (In your dev environment)
Make sure you are in the `master` branch when you pull for changes.
```sh
$ git pull
```

#### 7. Remove branch 
```sh
$ git branch -d feature
```









