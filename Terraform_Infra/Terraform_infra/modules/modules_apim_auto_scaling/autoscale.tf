resource "azapi_resource" "apim_scaling" {
  type      = "Microsoft.Insights/autoscalesettings@2022-10-01"
  name      = "Auto-scale-capacity-70-percentagevk"
  location  = data.azurerm_resource_group.rg.location
  parent_id = data.azurerm_resource_group.rg.id

  body = jsonencode({
    properties = {
      enabled = true
      name    = "Auto-scale-capacity-70-percentage"
      notifications = [
        {
          email = {
            customEmails = [
              "cloud@test.com"
            ]
            sendToSubscriptionAdministrator    = false
            sendToSubscriptionCoAdministrators = false
          }
          operation = "Scale"
        }
      ]
      profiles = [
        {
          capacity = {
            default = "1"
            maximum = "3"
            minimum = "1"
          }
          name = "Auto created default scale condition"
          rules = [
            {
              metricTrigger = {
                dimensions             = []
                dividePerInstance      = false
                metricName             = "Capacity"
                metricNamespace        = "microsoft.apimanagement/service"
                metricResourceLocation = data.azurerm_api_management.apim.location
                metricResourceUri      = data.azurerm_api_management.apim.id
                operator               = "GreaterThan"
                statistic              = "Average"
                threshold              = 70
                timeAggregation        = "Average"
                timeGrain              = "PT1M"
                timeWindow             = "PT10M"
              }
              scaleAction = {
                cooldown  = "PT5M"
                direction = "Increase"
                type      = "ChangeCount"
                value     = "1"
              }
            },
            {
              metricTrigger = {
                dimensions             = []
                dividePerInstance      = false
                metricName             = "Capacity"
                metricNamespace        = "microsoft.apimanagement/service"
                metricResourceLocation = data.azurerm_api_management.apim.location
                metricResourceUri      = data.azurerm_api_management.apim.id
                operator               = "LessThan"
                statistic              = "Average"
                threshold              = 65
                timeAggregation        = "Average"
                timeGrain              = "PT1M"
                timeWindow             = "PT10M"
              }
              scaleAction = {
                cooldown  = "PT5M"
                direction = "Decrease"
                type      = "ChangeCount"
                value     = "1"
              }
            }
          ]
        }
      ]
      targetResourceLocation = data.azurerm_api_management.apim.location
      targetResourceUri      = data.azurerm_api_management.apim.id
    }
  })
}