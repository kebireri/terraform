# View all policies
az policy assignment list --query "[].{Name:name, Scope:scope, Policy:policyDefinitionId}" --output table


# List all locations
az account list-locations --query "[].{Name:name, DisplayName:displayName}" --output table

# Find display name of policy

az policy assignment list --query "[?contains(displayName, 'region')].{Name:name, DisplayName:displayName}" --output table

# Find allowed locations for policy
az policy assignment list --query "[?name=='sys.regionrestriction'].parameters.listOfAllowedLocations.value[]" --output table