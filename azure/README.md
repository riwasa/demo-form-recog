1. Update script_variables.ps1:
 - Set $location to the code of the Azure region where resources will be deployed.
 - Set $locationName to the name of the Azure region.
 - Set $resourceGroupName to the name of the Resource Group in which resources will be deployed.
 - Set $resourceGroupRawName to the name of the Resource Group without special characters.6. 2. Run resource\_group\resource\_group.ps1 to create the Resource Group.
2. Run cosmos\_db\cosmos\_db.ps1 to create the Cosmos DB Account and Database.
3. Run container\_registry\container\_registry.ps1 to create the Container Registry.
4. Run application\_insights\application\_insights.ps1 to create the Application Insights Component.


