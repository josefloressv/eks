#!/bin/bash
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
export AWS_ACCESS_KEY_ID=changeme
export AWS_SECRET_ACCESS_KEY=changeme
export AWS_DEFAULT_REGION=us-east-1

# validate
aws sts get-caller-identity
aws iam get-user
