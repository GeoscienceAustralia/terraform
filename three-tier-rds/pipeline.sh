#!/bin/bash

terraform get
terraform plan
terraform apply
bundle exec rake spec
#terraform destroy -f
