# infra-s3-tf-helm

## terraform part

- assuming json already available and has necessary structure
- also users do have roles names corresponding to their usernames

**Plan on migrating from old setup to new setup (How and when to run? What happens to the TF state file?)**

- terraform import old s3 buckets

**Since the source now is dynamic how do we keep the buckets in S3 in sync with the external source? (e.g. if new user is added it is expected that the bucket is created automatically)**

- run as a Gitlab pipeline on daily basis, or using webhook

**Again on keeping users and their buckets in sync: since this list form REST API is dynamic, and if people would quite or leave the company, the would disappear from the list. What would happen to the TF code when apply happens? What could be done to support this corner case?**

- s3 buckets will be deleted

**Permissions for users to the respective S3 buckets**

- done in code

## helm part

- used: `helm create testing-appeventgen`

**Cover corner cases such as restarts on failures, app hanging and not producing any events (aka zombie).**

- liveness probe used

**Monitoring of the app, container, pod stats.**

- prometheus to use

**As the development of the app can change and potentially some REST API might be added, having services resources would be beneficial**

- service is created

**Taking into consideration fault tolerance and scalability**

- hpa and replicas more than 1
