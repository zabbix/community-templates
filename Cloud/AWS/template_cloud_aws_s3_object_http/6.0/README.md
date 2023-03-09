# AWS S3 bucket objects by HTTP

## Overview

For Zabbix version: 6.0 and higher

The template to monitor AWS S3 bucket objects (size and last modification) by HTTP via Zabbix that works without any external scripts.

Additional information about used API methods:
- https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html

## Author

Thiago Murilo Diniz

## Setup

The template gets AWS S3 bucket objects through the script item by making HTTP requests to the S3 API.

Before using the template, you need to create an IAM policy for the Zabbix role in your AWS account with the necessary permissions.

Add the following required permissions to your Zabbix IAM policy in order to list Amazon S3 bucket objects.

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::*"
        }
    ]
}
```

Set the macros "{$AWS.ACCESS.KEY.ID}", "{$AWS.SECRET.ACCESS.KEY}", "{$AWS.REGION}", "{$AWS.S3.BUCKET.NAME}"

## Zabbix configuration

No specific Zabbix configuration is required.

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$AWS.ACCESS.KEY.ID} |<p>Access key ID.</p> |`` |
|{$AWS.REGION} |<p>Amazon S3 Region code.</p> |`us-west-1` |
|{$AWS.S3.BUCKET.NAME} |<p>S3 bucket name.</p> |`` |
|{$AWS.SECRET.ACCESS.KEY} |<p>Secret access key.</p> |`` |
|{$AWS.S3.OBJECT.MODIFIED.MAX.INFO} |<p>Maximum number of days an object can remain unchanged.</p> |`2` |
|{$AWS.S3.OBJECT.SIZE.MAX.INFO} |<p>Maximum size in bytes an object can have.</p> |`31457280000` |
|{$AWS.S3.OBJECT.SIZE.MIN.INFO} |<p>Minimum size in bytes an object can have.</p> |`5242880` |


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Bucket Objects discovery |<p>Discovery bucket objects.</p> |DEPENDENT |aws.s3.objects.discovery<p>**Preprocessing**:</p><p>- JSONPath: `$.Contents`</p> |

## Items collected

|Group|Name|Description|Type|Key and additional info|
|-----|----|-----------|----|---------------------|
|Zabbix raw items |AWS S3: Get bucket objects |<p>Gets some or all (up to 1,000) of the objects in a bucket.</p> |SCRIPT |aws.s3.get_objects |
|AWS S3 |AWS S3: Get bucket objects check |<p>Data collection check.</p> |DEPENDENT |aws.s3.get_objects.check<p>**Preprocessing**:</p><p>- JSONPath: `$.error`</p><p>⛔️ON_FAIL: `CUSTOM_VALUE -> `</p><p>- DISCARD_UNCHANGED_HEARTBEAT: `3h`</p> |
|AWS S3 |AWS S3 Object: ["{#KEY}"]: Last Modified |<p>How many days ago the object was modified.</p> |DEPENDENT |aws.s3.bucket.object_modified["{#KEY}"]<p>**Preprocessing**:</p><p>- JSONPath: `$.Contents[?(@.Key== '{#KEY}')].LastModified.first()`</p><p>⛔️ON_FAIL: `DISCARD_VALUE -> `</p><p>- JAVASCRIPT: `The text is too long. Please see the template.`</p> |
|AWS S3 |AWS S3 Object: ["{#KEY}"]: Size |<p>Size in bytes of the object.</p> |DEPENDENT |aws.s3.bucket.object_size["{#KEY}"]<p>**Preprocessing**:</p><p>- JSONPath: `$.Contents[?(@.Key== '{#KEY}')].Size.first()`</p><p>⛔️ON_FAIL: `DISCARD_VALUE -> `</p> |

## Triggers

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----|----|----|
| | | | | |
https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/cloud/AWS/aws_s3_http/README.md?at=refs%2Ftags%2F6.0.14

## Feedback

Please report any issues with the template at https://github.com/zabbix/community-templates