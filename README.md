[![Build Status](https://travis-ci.org/GeoscienceAustralia/terraform.svg?branch=master)](https://travis-ci.org/GeoscienceAustralia/terraform)

# Cloud Examples
Terraform examples to be referenced at cloud.ga.gov.au.

Individual modules can be referenced from terraform files using `source = "github.com/GeoscienceAustralia/terraform//modules/vpc"`

## Contents

* **s3-www-cloudfront**
* **three-tier-rds**
* **two-tier-rds**
* **terraform-workshop**

## Install
1. Download and install [awscli](https://aws.amazon.com/cli/)
1. Create [Access Keys for your user](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)
1. Configure awscli to [use your keys](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-using-examples)
1. **NB: These examples only support the region ap-southeast-2**
1. Download and install [terraform](https://www.terraform.io/downloads.html)
1. Download and install [terragrunt](https://github.com/gruntwork-io/terragrunt/releases)

## Usage
Each item has its own README

## Running tests
1. Download and install [ruby >2.1](https://www.ruby-lang.org/en/downloads/)
1. install bundler `gem install bundler`
1. browse to the directory you want to test
1. `bundle install`
1. `bundle exec rake spec`
