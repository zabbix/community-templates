#!/bin/bash
# Check if a Gitlab instance software is up-to-date
#
# Created by John W Kerns (https://github.com/PackeTsar)
#
# Example Usage: ./gitlab_update_check.sh gitlab.example.com "PeRSoNaLaCcEsStOkEn"
#
#
# HOW IT WORKS:
# This script will query the API of your self-hosted Gitlab instance for its
# current software version. The returned information is standard JSON data
# like '{"version":"14.5.2-ee","revision":"4511944420f"}'. It will encode that
# JSON string into Base64 data and save it as variable "GITLABBASE64VER"
#
# The script will then use that Base64 version data in a curl request to
# version.gitlab.com and will pass the encoded version data as a query parameter.
# This request will return HTML data to draw a SVG image. A Perl script is then
# used to search this HTML data for the status text which should read one of
# three things:
#     1. up-to-date
#     2. new version out
#     3. update asap
# This status text is passed out to STDOUT by the script
#
#
# MORE INFO ABOUT GITLAB'S VERSION CHECK SERVICE:
# - https://about.gitlab.com/blog/2015/05/07/version-check/
# - https://about.gitlab.com/handbook/sales/process/version-check/

# Grab variables from CLI
GITLABHOSTNAME=${1:?"missing arg 1 for GITLABHOSTNAME"}
GITLABTOKEN=${2:?"missing arg 2 for GITLABTOKEN"}

# Grab the Base64 encoded current version info from Gitlab instance
GITLABBASE64VER=$(curl --header "PRIVATE-TOKEN: $GITLABTOKEN" https://$GITLABHOSTNAME/api/v4/version 2> /dev/null | base64 -w 0)

# Request the status of this software version from version.gitlab.com and get the text from the HTML response
GITLABRESPONSE=$(curl "https://version.gitlab.com/check.svg?gitlab_info=$GITLABBASE64VER" -H "Referer: https://$GITLABHOSTNAME/" 2> /dev/null | \
perl -nE "say \$1 if /((?<=>)(.*?)(?=<))/")

# If the "unable to connect" is received back from version.gitlab.com
if [ "$GITLABRESPONSE" == "unable to connect" ]; then
  # Then the API token may have been wrong in the query to the gitlab instance
  # Throw an error and exit with a code
  echo "Error: \"unable to connect\", check your Gitlab access token"
  exit 1
else
  echo $GITLABRESPONSE
fi

# Remove the variables
unset GITLABHOSTNAME GITLABTOKEN GITLABBASE64VER GITLABRESPONSE
