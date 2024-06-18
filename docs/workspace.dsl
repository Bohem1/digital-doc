workspace "rio" "digital docs example" {


  model {

    externalUser = person "ExternalRIOUser" {
        tags "InternalUser"
    }
    internalUser = person "InternalRIOUser"

    rio = softwareSystem "RIOPlatform" {

      frontend = container "SPA Web App" {
        #internalUser -> this "Uses"
      }

      webhookReciever = container "WebhookReciever" {

      }

      backend-service-1 = container "BackendService1" {

        api1 = component "APIGateway" {
          frontend -> this "Calls"
        }

        db1 = component "Database" {
          api1 -> this "Reads from and writes to"

        }
      }

      backend-service-2 = container "BackendService2" {
        this -> db1 "Reads from"

        api2 = component "APIGateway2" {
          #frontend -> this "requests CRUD Calls"
        }

        db2 = component "Database 2" {
          api2 -> this "Reads from and writes to"
        }
      }


    }

    externalSystem = softwareSystem "ExternalSystem" {
      tags "ExternalSystem"
      this -> webhookReciever "Triggers and send webhooks to trigger jobs"
    }


    webhookReciever -> api2 "Calls API to write to database 2"



    externalUser -> externalSystem "Logs on to application to read and write documents"
    internalUser -> rio "Logs on to application to read the docs"


  }


  views {

    systemContext rio  {
      include *
      autoLayout lr
    }

    systemContext externalSystem {
      include *
      autoLayout lr
    }

    container rio {
      include *
      autoLayout lr
    }

    component backend-service-1 {
      include *
      autoLayout lr
    }

    component backend-service-2 {
      include *
      autoLayout lr
    }


    theme "https://static.structurizr.com/themes/microsoft-azure-2021.01.26/theme.json"

    styles {

        element "Person" {
            shape person
        }

        element "Element" {
            background #1168bd
            color #ffffff
            shape RoundedBox
        }

        element "InternalUser" {
            background #116611
        }

        element "ExternalUser" {
            background #449082
        }

        element "ExternalSystem" {
            background #449082
        }

    }
  }



  configuration {
    scope softwaresystem
  }

}
