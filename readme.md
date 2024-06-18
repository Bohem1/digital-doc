# Background

> This file is part of the digital-doc module, originally created 6/16/2024 10:51:51 PM

The Platform team is tasked to provide infrastructure and guidance for a new initiative named RIO. The RIO project is tasked with building both internal and extern web services.

The project does not yet know the end state but have invited us to experiment to show what we can deliver within a week to support the initial architecture.

in this experiment we have chosen to use terraform for our IaC tool.
Any pipeline will be targeting GitHub actions for deployment.
The project will be created to use Azure as a public cloud platform.

The components selected might not be production grade ready inhouse yet, but we will build services that are within the company standard.

## Project folder structure

This experiment is structured in a single repository contain the whole setup. This structure might deviate from the structure needed for the final solution as multiple teams and responsibilities most likely will be involved at a later state.

All application code for the experiment is contained in subfolders under the [**components**](./components) folder.

All terraform code is contained under in the [**terraform**](./terraform) folder.
The different stacks are contained in seperate sub folders. This is done to support the devops flow and preserve the sanity of the team members experimenting together.

In the [**terraform/stacks**](./terraform/stacks/) folder all the configurations for the core, frontend and backend stacks are sorted in subfolders. This makes it simpler to create pipelines to support the testing and deployment of the stacks. In other scenarios this structure might use seperate repositories.

Any terraform modules created to support multiple stacks are created in subfolders within the [**terraform/modules**](./terraform/modules/) folder. The modules path is identified with the path '../../modules/module-name/' in the stacks.

Any pipelines for GitHub are stored under [**.github/workflows**](./.github/workflows/) and named after the stack they are set up to use.

## Components

> This chapter will describe the initial components needed for this experiment

![overview](./docs/mermaid/structurizr-Container-001.mmd)

```mermaid
graph LR
  linkStyle default fill:#ffffff

  subgraph diagram ["RIOPlatform - BackendService2 - Components"]
    style diagram fill:#ffffff,stroke:#ffffff

    5("<div style='font-weight: bold'>WebhookReciever</div><div style='font-size: 70%; margin-top: 0px'>[Container]</div>")
    style 5 fill:#1168bd,stroke:#0b4884,color:#ffffff

    subgraph 12 [BackendService2]
      style 12 fill:#ffffff,stroke:#0b4884,color:#0b4884

      15("<div style='font-weight: bold'>APIGateway2</div><div style='font-size: 70%; margin-top: 0px'>[Component]</div>")
      style 15 fill:#1168bd,stroke:#0b4884,color:#ffffff
      16("<div style='font-weight: bold'>Database 2</div><div style='font-size: 70%; margin-top: 0px'>[Component]</div>")
      style 16 fill:#1168bd,stroke:#0b4884,color:#ffffff
    end

    15-. "<div>Reads from and writes to</div><div style='font-size: 70%'></div>" .->16
    5-. "<div>Calls API to write to<br />database 2</div><div style='font-size: 70%'></div>" .->15
  end

```

----

```mermaid
graph LR
  linkStyle default fill:#ffffff

  subgraph diagram ["RIOPlatform - Containers"]
    style diagram fill:#ffffff,stroke:#ffffff

    18("<div style='font-weight: bold'>ExternalSystem</div><div style='font-size: 70%; margin-top: 0px'>[Software System]</div>")
    style 18 fill:#449082,stroke:#2f645b,color:#ffffff

    subgraph 3 [RIOPlatform]
      style 3 fill:#ffffff,stroke:#0b4884,color:#0b4884

      12("<div style='font-weight: bold'>BackendService2</div><div style='font-size: 70%; margin-top: 0px'>[Container]</div>")
      style 12 fill:#1168bd,stroke:#0b4884,color:#ffffff
      4("<div style='font-weight: bold'>SPA Web App</div><div style='font-size: 70%; margin-top: 0px'>[Container]</div>")
      style 4 fill:#1168bd,stroke:#0b4884,color:#ffffff
      5("<div style='font-weight: bold'>WebhookReciever</div><div style='font-size: 70%; margin-top: 0px'>[Container]</div>")
      style 5 fill:#1168bd,stroke:#0b4884,color:#ffffff
      6("<div style='font-weight: bold'>BackendService1</div><div style='font-size: 70%; margin-top: 0px'>[Container]</div>")
      style 6 fill:#1168bd,stroke:#0b4884,color:#ffffff
    end

    12-. "<div>Reads from</div><div style='font-size: 70%'></div>" .->6
    18-. "<div>Triggers and send webhooks to<br />trigger jobs</div><div style='font-size: 70%'></div>" .->5
    5-. "<div>Calls API to write to<br />database 2</div><div style='font-size: 70%'></div>" .->12
    4-. "<div>Calls</div><div style='font-size: 70%'></div>" .->6
  end
```

```mermaid
graph LR
  linkStyle default fill:#ffffff

  subgraph diagram ["RIOPlatform - BackendService1 - Components"]
    style diagram fill:#ffffff,stroke:#ffffff

    12("<div style='font-weight: bold'>BackendService2</div><div style='font-size: 70%; margin-top: 0px'>[Container]</div>")
    style 12 fill:#1168bd,stroke:#0b4884,color:#ffffff
    4("<div style='font-weight: bold'>SPA Web App</div><div style='font-size: 70%; margin-top: 0px'>[Container]</div>")
    style 4 fill:#1168bd,stroke:#0b4884,color:#ffffff

    subgraph 6 [BackendService1]
      style 6 fill:#ffffff,stroke:#0b4884,color:#0b4884

      10("<div style='font-weight: bold'>Database</div><div style='font-size: 70%; margin-top: 0px'>[Component]</div>")
      style 10 fill:#1168bd,stroke:#0b4884,color:#ffffff
      7("<div style='font-weight: bold'>APIGateway</div><div style='font-size: 70%; margin-top: 0px'>[Component]</div>")
      style 7 fill:#1168bd,stroke:#0b4884,color:#ffffff
    end

    7-. "<div>Reads from and writes to</div><div style='font-size: 70%'></div>" .->10
    12-. "<div>Reads from</div><div style='font-size: 70%'></div>" .->10
    4-. "<div>Calls</div><div style='font-size: 70%'></div>" .->7
  end

```

### Core

TODO document core components

The project weill deploy all components within a single subscription in Azure.
each stack will exist within it's own resource group where it makes sense. We will use a simplified naming convention for the experiment and thereby deviating from the company standard. This is approved by the architects.

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

### OSS and common services

> this chapter will describe any common services and frameworks that have been included to support the experiment. Documentation for these are linked in the table below.

| name | description |
| ---- | ----------- |
| [vscode](https://code.visualstudio.com) | lightweight IDE |
| [terraform-docs](https://terraform-docs.io/user-guide/introduction/) | tool to automate updating of documentation for terraform modules |
| [Structurizr Lite](https://docs.structurizr.com/lite) | C4 diagrams as code tool |
|     |      |
|     |      |
|     |      |

## Known issues

> This chapter will describe any known errors with regards to this experiment

## Todo

> This chapter will describe the next steps to improve the experiment
