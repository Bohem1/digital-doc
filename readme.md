# Background

> This file is part of the digital-doc module, originally created 6/16/2024 10:51:51 PM

The Platform team is tasked to provide infrastructure and guidance for a new initiative named RIO. The RIO project is tasked with building both internal and extern web services.

The project does not yet know the end state but have invited us to experiment to show what we can deliver within a week to support the initial architecture.

## Project folder structure

This experiment is structured in a single repository contain the whole setup. This structure might deviate from the structure needed for the final solution as multiple teams and responsibilities most likely will be involved at a later state.

All terraform code is contained under in the **terraform** folder.
The different stacks are contained in seperate sub folders. This is done to support the devops flow and preserve the sanity of the team members experimenting together.

In the **terraform/stacks** folder all the configurations for the core, frontend and backend stacks are sorted in subfolders. This makes it simpler to create pipelines to support the testing and deployment of the stacks. In other scenarios this structure might use seperate repositories.

Any terraform modules created to support multiple stacks are created in subfolders within the **terraform/modules** folder. The modules path is identified with the path '../../modules/module-name/' in the stacks.

Any pipelines for GitHub are stored under **.github/workflows** and named after the stack they are set up to use.

## Components

> This chapter will describe the initial components needed for this experiment

TODO Add solution overview drawing and description

### Core

TODO document core components

### Frontend spa

TODO document

### Backend service 1

TODO document

### Backend service 2

TODO document

## Setup

> This chapter will describe all the steps needed to deploy the experiment

TODO document

## Test

> This chapter will describe the testing setup enabled in this experiment

TODO document
