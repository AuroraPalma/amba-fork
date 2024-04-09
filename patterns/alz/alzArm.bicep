targetScope = 'managementGroup'

@description('Provide a prefix (unique at tenant-scope) for the Management Group hierarchy and other resources created as part of Enterprise-scale.')
param enterpriseScaleCompanyPrefix string

@description('The customer usage identifier used for telemetry purposes. The default value of False enables telemetry. The value of True disables telemetry.')
@allowed([
  'Yes'
  'No'
])
param telemetryOptOut string = 'No'

@description('Provide the name of the Management Group that will be used to host the platform resources.')
param platformManagementGroup string

@description('Provide the name of the Management Group that will be used to host the identity resources.')
param IdentityManagementGroup string

@description('Provide the name of the Management Group that will be used to host the management resources.')
param managementManagementGroup string

@description('Provide the name of the Management Group that will be used to host the connectivity resources.')
param connectivityManagementGroup string

@description('Provide the name of the Management Group that will be used to host the landing zone resources.')
param LandingZoneManagementGroup string

@description('Assign Connectivity initiative')
@allowed([
  'Yes'
  'No'
])
param enableAMBAConnectivity string = 'Yes'

@description('Assign Identity initiative')
@allowed([
  'Yes'
  'No'
])
param enableAMBAIdentity string = 'Yes'

@description('Assign Landing zone initiative')
@allowed([
  'Yes'
  'No'
])
param enableAMBALandingZone string = 'Yes'

@description('Assign Management initiative')
@allowed([
  'Yes'
  'No'
])
param enableAMBAManagement string = 'Yes'

@description('Assign Service health initiative')
@allowed([
  'Yes'
  'No'
])
param enableAMBAServiceHealth string = 'Yes'

@description('Assign Action assets initiative')
@allowed([
  'Yes'
  'No'
])
param enableAMBANotificationAssets string = 'Yes'

@description('Configure the count of empty deployments used to introduce a delay after policy deployment. Used to increase reliability of deployment, but can be reduced when re-deploying to an existing environment.')
@minValue(1)
@maxValue(60)
param delayCount int = 1

@description('The current date and time using the utcNow function. Used for deployment name uniqueness')
param currentDateTimeUtcNow string = utcNow()
param policyAssignmentParametersCommon object = {}
param policyAssignmentParametersNotificationAssets object = {}
param policyAssignmentParametersConnectivity object = {}
param policyAssignmentParametersIdentity object = {}
param policyAssignmentParametersLandingZone object = {}
param policyAssignmentParametersManagement object = {}
param policyAssignmentParametersServiceHealth object = {}

var policyAssignmentParametersConnectivity_var = union(
  policyAssignmentParametersCommon,
  policyAssignmentParametersConnectivity
)
var policyAssignmentParametersIdentity_var = union(policyAssignmentParametersCommon, policyAssignmentParametersIdentity)
var policyAssignmentParametersLandingZone_var = union(
  policyAssignmentParametersCommon,
  policyAssignmentParametersLandingZone
)
var policyAssignmentParametersManagement_var = union(
  policyAssignmentParametersCommon,
  policyAssignmentParametersManagement
)
var policyAssignmentParametersServiceHealth_var = union(
  policyAssignmentParametersCommon,
  policyAssignmentParametersServiceHealth,
  policyAssignmentParametersNotificationAssets
)
var policyAssignmentParametersNotificationAssets_var = union(
  policyAssignmentParametersCommon,
  policyAssignmentParametersNotificationAssets
)
var deploymentUris = {
  policyDefinitionsAMBA: uri(deployment().properties.templateLink.uri, 'policyDefinitions/policies.json')
  AMBAConnectivityInitiative: uri(
    deployment().properties.templateLink.uri,
    'policyAssignments/DINE-ConnectivityAssignment.json'
  )
  AMBAIdentityInitiative: uri(
    deployment().properties.templateLink.uri,
    'policyAssignments/DINE-IdentityAssignment.json'
  )
  AMBALandingZoneInitiative: uri(
    deployment().properties.templateLink.uri,
    'policyAssignments/DINE-LandingZoneAssignment.json'
  )
  AMBAManagementInitiative: uri(
    deployment().properties.templateLink.uri,
    'policyAssignments/DINE-ManagementAssignment.json'
  )
  AMBAServiceHealthInitiative: uri(
    deployment().properties.templateLink.uri,
    'policyAssignments/DINE-ServiceHealthAssignment.json'
  )
  AMBANotificationAssetsInitiative: uri(
    deployment().properties.templateLink.uri,
    'policyAssignments/DINE-NotificationAssetsAssignment.json'
  )
}
var deploymentSuffix = '-${deployment().location}-${guid(enterpriseScaleCompanyPrefix,currentDateTimeUtcNow)}'
var deploymentNames = {
  AMBAPolicyDeploymentName: take('amba-Policy${deploymentSuffix}', 64)
  AMBAConnectivityDeploymentName: take('amba-Connectivity${deploymentSuffix}', 64)
  AMBAIdentityDeploymentName: take('amba-Identity${deploymentSuffix}', 64)
  AMBALandingZoneDeploymentName: take('amba-LandingZone${deploymentSuffix}', 64)
  AMBAManagementDeploymentName: take('amba-Management${deploymentSuffix}', 64)
  AMBAServiceHealthDeploymentName: take('amba-ServiceHealth${deploymentSuffix}', 64)
  AMBANotificationAssetsDeploymentName: take('amba-NotificationAssets${deploymentSuffix}', 64)
  pidCuaDeploymentName: take(
    'amba-pid-${cuaid}-${uniqueString(deployment().location,enterpriseScaleCompanyPrefix,currentDateTimeUtcNow)}',
    64
  )
  pidCuaConnectivityDeploymentName: take(
    'amba-pid-${cuaidConnectivity}-${uniqueString(deployment().location,enterpriseScaleCompanyPrefix,currentDateTimeUtcNow)}',
    64
  )
  pidCuaIdentityDeploymentName: take(
    'amba-pid-${cuaidIdentity}-${uniqueString(deployment().location,enterpriseScaleCompanyPrefix,currentDateTimeUtcNow)}',
    64
  )
  pidCuaManagementDeploymentName: take(
    'amba-pid-${cuaidManagement}-${uniqueString(deployment().location,enterpriseScaleCompanyPrefix,currentDateTimeUtcNow)}',
    64
  )
  pidCuaLandingZoneDeploymentName: take(
    'amba-pid-${cuaidLandingZone}-${uniqueString(deployment().location,enterpriseScaleCompanyPrefix,currentDateTimeUtcNow)}',
    64
  )
  pidCuaServiceHealthDeploymentName: take(
    'amba-pid-${cuaidServiceHealth}-${uniqueString(deployment().location,enterpriseScaleCompanyPrefix,currentDateTimeUtcNow)}',
    64
  )
  pidCuaNotificationAssetsDeploymentName: take(
    'amba-pid-${cuaidNotificationAssets}-${uniqueString(deployment().location,enterpriseScaleCompanyPrefix,currentDateTimeUtcNow)}',
    64
  )
}
var cuaid = 'd6b3b08c-5825-4b89-a62b-e3168d3d8fb0'
var cuaidConnectivity = '2d69aa07-8780-4697-a431-79882cb9f00e'
var cuaidIdentity = '8d257c20-97bf-4d14-acb3-38dd1436d13a'
var cuaidManagement = 'd87415c4-01ef-4667-af89-0b5adc14af1b'
var cuaidLandingZone = '7bcfc615-be78-43da-b81d-98959a9465a5'
var cuaidServiceHealth = '860d2afd-b71e-452f-9d3a-e56196cba570'
var cuaidNotificationAssets = 'eabaaf0b-eed4-48a9-9f91-4f7e431ba807'

module deploymentNames_AMBAPolicyDeployment '?' /*TODO: replace with correct path to [variables('deploymentUris').policyDefinitionsAMBA]*/ = {
  name: deploymentNames.AMBAPolicyDeploymentName
  params: {
    topLevelManagementGroupPrefix: enterpriseScaleCompanyPrefix
  }
  dependsOn: []
}

@batchSize(1)
module amba_PreparingToLaunch './nested_amba_PreparingToLaunch.bicep' = [
  for i in range(0, delayCount): {
    name: 'amba-PreparingToLaunch${i}'
    params: {}
    dependsOn: [
      deploymentNames_AMBAPolicyDeployment
    ]
  }
]

module deploymentNames_AMBAConnectivityDeployment '?' /*TODO: replace with correct path to [variables('deploymentUris').AMBAConnectivityInitiative]*/ =
  if (enableAMBAConnectivity == 'Yes') {
    name: deploymentNames.AMBAConnectivityDeploymentName
    params: {
      topLevelManagementGroupPrefix: enterpriseScaleCompanyPrefix
      policyAssignmentParameters: policyAssignmentParametersConnectivity_var
    }
    dependsOn: [
      amba_PreparingToLaunch
    ]
  }

module deploymentNames_AMBAIdentityDeployment '?' /*TODO: replace with correct path to [variables('deploymentUris').AMBAIdentityInitiative]*/ =
  if (enableAMBAIdentity == 'Yes') {
    name: deploymentNames.AMBAIdentityDeploymentName
    params: {
      topLevelManagementGroupPrefix: enterpriseScaleCompanyPrefix
      policyAssignmentParameters: policyAssignmentParametersIdentity_var
    }
    dependsOn: [
      amba_PreparingToLaunch
    ]
  }

module deploymentNames_AMBALandingZoneDeployment '?' /*TODO: replace with correct path to [variables('deploymentUris').AMBALandingZoneInitiative]*/ =
  if (enableAMBALandingZone == 'Yes') {
    name: deploymentNames.AMBALandingZoneDeploymentName
    params: {
      topLevelManagementGroupPrefix: enterpriseScaleCompanyPrefix
      policyAssignmentParameters: policyAssignmentParametersLandingZone_var
    }
    dependsOn: [
      amba_PreparingToLaunch
    ]
  }

module deploymentNames_AMBAManagementDeployment '?' /*TODO: replace with correct path to [variables('deploymentUris').AMBAManagementInitiative]*/ =
  if (enableAMBAManagement == 'Yes') {
    name: deploymentNames.AMBAManagementDeploymentName
    params: {
      topLevelManagementGroupPrefix: enterpriseScaleCompanyPrefix
      policyAssignmentParameters: policyAssignmentParametersManagement_var
    }
    dependsOn: [
      amba_PreparingToLaunch
    ]
  }

module deploymentNames_AMBAServiceHealthDeployment '?' /*TODO: replace with correct path to [variables('deploymentUris').AMBAServiceHealthInitiative]*/ =
  if (enableAMBAServiceHealth == 'Yes') {
    name: deploymentNames.AMBAServiceHealthDeploymentName
    params: {
      topLevelManagementGroupPrefix: enterpriseScaleCompanyPrefix
      policyAssignmentParameters: policyAssignmentParametersServiceHealth_var
    }
    dependsOn: [
      amba_PreparingToLaunch
    ]
  }

module deploymentNames_AMBANotificationAssetsDeployment '?' /*TODO: replace with correct path to [variables('deploymentUris').AMBANotificationAssetsInitiative]*/ =
  if (enableAMBANotificationAssets == 'Yes') {
    name: deploymentNames.AMBANotificationAssetsDeploymentName
    params: {
      topLevelManagementGroupPrefix: enterpriseScaleCompanyPrefix
      policyAssignmentParameters: policyAssignmentParametersNotificationAssets_var
    }
    dependsOn: [
      amba_PreparingToLaunch
    ]
  }

module deploymentNames_pidCuaDeployment './nested_deploymentNames_pidCuaDeployment.bicep' =
  if (telemetryOptOut == 'No') {
    name: deploymentNames.pidCuaDeploymentName
    params: {}
  }

module deploymentNames_pidCuaConnectivityDeployment './nested_deploymentNames_pidCuaConnectivityDeployment.bicep' =
  if ((telemetryOptOut == 'No') && (enableAMBAConnectivity == 'Yes')) {
    name: deploymentNames.pidCuaConnectivityDeploymentName
    params: {}
  }

module deploymentNames_pidCuaIdentityDeployment './nested_deploymentNames_pidCuaIdentityDeployment.bicep' =
  if ((telemetryOptOut == 'No') && (enableAMBAIdentity == 'Yes')) {
    name: deploymentNames.pidCuaIdentityDeploymentName
    params: {}
  }

module deploymentNames_pidCuaManagementDeployment './nested_deploymentNames_pidCuaManagementDeployment.bicep' =
  if ((telemetryOptOut == 'No') && (enableAMBAManagement == 'Yes')) {
    name: deploymentNames.pidCuaManagementDeploymentName
    params: {}
  }

module deploymentNames_pidCuaLandingZoneDeployment './nested_deploymentNames_pidCuaLandingZoneDeployment.bicep' =
  if ((telemetryOptOut == 'No') && (enableAMBALandingZone == 'Yes')) {
    name: deploymentNames.pidCuaLandingZoneDeploymentName
    params: {}
  }

module deploymentNames_pidCuaServiceHealthDeployment './nested_deploymentNames_pidCuaServiceHealthDeployment.bicep' =
  if ((telemetryOptOut == 'No') && (enableAMBAServiceHealth == 'Yes')) {
    name: deploymentNames.pidCuaServiceHealthDeploymentName
    params: {}
  }

module deploymentNames_pidCuaNotificationAssetsDeployment './nested_deploymentNames_pidCuaNotificationAssetsDeployment.bicep' =
  if ((telemetryOptOut == 'No') && (enableAMBANotificationAssets == 'Yes')) {
    name: deploymentNames.pidCuaNotificationAssetsDeploymentName
    params: {}
  }

output deployment string = '${deployment().name} has successfully deployed.'
