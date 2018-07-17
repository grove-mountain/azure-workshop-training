# Azure Workshop Tag Flow

This directory intends to make instructor workflows for Azure workshops much easier to do.   It can also be used by students who are averse to copypasta or typing stuff in on their own.  Because all files are in one directory, you'll be able to use the same state between changes.    

For students sharing a subscription, makes sure to customize the ${var.student} variable so there aren't name conflicts in the environment.

## Basic process

* Check out this repo
* cd workspaces/tag_flow (this directory)
* Get a list of tags: `git tag -l`
* For each tag: `git checkout $tag;terraform plan;terraform apply` (Pausing as necessary of course)

Example:
```
~/git/terraform/azure-workshop-training/workspaces/tag_flow: master
[jake@Pris]git tag -l
1-hello-world
2-adding-tags
3-change-to-variables
4-add-simple-network
5-add-output
5-complete
6-add-subnet
7-add-compute-module
~/git/terraform/azure-workshop-training/workspaces/tag_flow: master
[jake@Pris]git checkout 1-hello-world
Note: checking out '1-hello-world'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at f4fab03... jake_flow_tweaks: tag_flow_1
~/git/terraform/azure-workshop-training/workspaces/tag_flow: (HEAD detached at 1-hello-world)
[jake@Pris]terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + azurerm_resource_group.myfirstrg
      id:       <computed>
      location: "eastus"
      name:     "myFirstResourceGroup"
      tags.%:   <computed>


Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.

~/git/terraform/azure-workshop-training/workspaces/tag_flow: (HEAD detached at 1-hello-world)
[jake@Pris]git checkout 2-adding-tags
Previous HEAD position was f4fab03... jake_flow_tweaks: tag_flow_1
HEAD is now at d8c9a43... jake_flow_tweaks: tag_flow_2
~/git/terraform/azure-workshop-training/workspaces/tag_flow: (HEAD detached at 2-adding-tags)
[jake@Pris]terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + azurerm_resource_group.myfirstrg
      id:               <computed>
      location:         "eastus"
      name:             "myFirstResourceGroup"
      tags.%:           "3"
      tags.environment: "Production"
      tags.owner:       "ops@"
      tags.ttl:         "-1"


Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```



