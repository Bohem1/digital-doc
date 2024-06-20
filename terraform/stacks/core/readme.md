# README

> This file is part of the core module, originally created 6/16/2024 11:26:45 PM

## Components

For the core of this setup we have a few components planned.

We are simulating a core platform team that will provide the RIO team with a new Azure landing zone. A typical landing zone will contain much more that what we need in this setup.

- there are no policies in place other than default policies
- we are using a simplified naming convention
- No authentication as we do not have our Entra Id setup in place to support the experiment
- Core components identified are
  - Virtual network
  - API Management (Developer edition) to secure the apis and to enable rate limiting for the APIs
  - Application support and deployment using Azure Container Apps to emulate the use of AKS. This is done to minimize cost  and not only complexity of the service created
  - Azure container registry to store any container images
  - Azure Storage Account to store our terraform state files as the team is working together
  - We have agreed that any application code should leverage DAPR for any infrastructure calls.
  - Azure SQL will be used to support more advanced sql services, where the DAPR provided State store is not enough for the application. The DAPR statestore of choice is an Azure Table storage.
