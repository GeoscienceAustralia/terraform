# Cloud Examples

Code examples to be referenced at cloud.ga.gov.au.

## Contents
* **s3-www-cloudfront** (Development in Progress)
* **three-tier-rds**
* **two-tier-rds**

## Install
Download and install [terraform](https://www.terraform.io/downloads.html)

## Usage
Each stack has its own README
If you wish to use the modules alone, you can reference them using `source="github.com/GeoscienceAustralia/terraform//modules/vpc"`

## Contributing
Each example has a test suite (generated with [awspec](https://github.com/k1LoW/awspec)), if you make changes that will cause the tests to fail, 
please ensure to update the tests using the [awspec generate](https://github.com/k1LoW/awspec#advanced-tips-spec-generate-command) command