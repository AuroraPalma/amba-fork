using 'alzArm.bicep'

param enterpriseScaleCompanyPrefix = 'downunder'

param platformManagementGroup = 'downunder-platform'

param IdentityManagementGroup = 'downunder-identity'

param managementManagementGroup = 'downunder-management'

param connectivityManagementGroup = 'downunder-connectivity'

param LandingZoneManagementGroup = 'downunder-landing-zones'

param enableAMBAConnectivity = 'No'

param enableAMBAIdentity = 'No'

param enableAMBALandingZone = 'Yes'

param enableAMBAManagement = 'No'

param enableAMBAServiceHealth = 'No'

param enableAMBANotificationAssets = 'No'

param telemetryOptOut = 'No'

param policyAssignmentParametersCommon = {
  ALZMonitorResourceGroupName: {
    value: 'amba-monitor-Rjsz'
  }
  ALZMonitorResourceGroupTags: {
    value: {
      Project: 'amba-monitoring'
    }
  }
  ALZMonitorResourceGroupLocation: {
    value: 'norwayeast'
  }
}

param policyAssignmentParametersNotificationAssets = {
  ALZMonitorActionGroupEmail: {
    value: 'aurora.palma.nieto@arribatec.com'
  }
  ALZLogicappResourceId: {
    value: ''
  }
  ALZLogicappCallbackUrl: {
    value: ''
  }
  ALZArmRoleId: {
    value: ''
  }
  ALZEventHubResourceId: {
    value: ''
  }
  ALZWebhookServiceUri: {
    value: ''
  }
  ALZFunctionResourceId: {
    value: ''
  }
  ALZFunctionTriggerUrl: {
    value: ''
  }
}

param policyAssignmentParametersServiceHealth = {
  ResHlthUnhealthyAlertState: {
    value: 'true'
  }
  ResHlthUnhealthyPolicyEffect: {
    value: 'deployIfNotExists'
  }
  SvcHlthAdvisoryAlertState: {
    value: 'true'
  }
  serviceHealthAdvisoryPolicyEffect: {
    value: 'deployIfNotExists'
  }
  SvcHlthIncidentAlertState: {
    value: 'true'
  }
  serviceHealthIncidentPolicyEffect: {
    value: 'deployIfNotExists'
  }
  SvcHlthMaintenanceAlertState: {
    value: 'true'
  }
  serviceHealthMaintenancePolicyEffect: {
    value: 'deployIfNotExists'
  }
  svcHlthSecAdvisoryAlertState: {
    value: 'true'
  }
  serviceHealthSecurityPolicyEffect: {
    value: 'deployIfNotExists'
  }
}

param policyAssignmentParametersConnectivity = {
  ERCIRQoSDropBitsinPerSecAlertSeverity: {
    value: '2'
  }
  ERCIRQoSDropBitsinPerSecWindowSize: {
    value: 'PT5M'
  }
  ERCIRQoSDropBitsinPerSecEvaluationFrequency: {
    value: 'PT5M'
  }
  ERCIRQoSDropBitsinPerSecPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERCIRQoSDropBitsinPerSecAlertState: {
    value: 'true'
  }
  ERCIRQoSDropBitsoutPerSecAlertSeverity: {
    value: '2'
  }
  ERCIRQoSDropBitsoutPerSecWindowSize: {
    value: 'PT5M'
  }
  ERCIRQoSDropBitsoutPerSecEvaluationFrequency: {
    value: 'PT5M'
  }
  ERCIRQoSDropBitsoutPerSecPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERCIRQoSDropBitsoutPerSecAlertState: {
    value: 'true'
  }
  VPNGwBGPPeerStatusAlertSeverity: {
    value: '3'
  }
  VPNGwBGPPeerStatusWindowSize: {
    value: 'PT5M'
  }
  VPNGwBGPPeerStatusEvaluationFrequency: {
    value: 'PT5M'
  }
  VPNGwBGPPeerStatusPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VPNGwBGPPeerStatusAlertState: {
    value: 'true'
  }
  VPNGwBGPPeerStatusThreshold: {
    value: '1'
  }
  VnetGwERCpuUtilAlertSeverity: {
    value: '3'
  }
  VnetGwERCpuUtilWindowSize: {
    value: 'PT5M'
  }
  VnetGwERCpuUtilEvaluationFrequency: {
    value: 'PT1M'
  }
  VnetGwERCpuUtilPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VnetGwERCpuUtilAlertState: {
    value: 'true'
  }
  VnetGwERCpuUtilThreshold: {
    value: '80'
  }
  VnetGwTunnelBWAlertSeverity: {
    value: '0'
  }
  VnetGwTunnelBWWindowSize: {
    value: 'PT5M'
  }
  VnetGwTunnelBWEvaluationFrequency: {
    value: 'PT1M'
  }
  VnetGwTunnelBWPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VnetGwTunnelBWAlertState: {
    value: 'true'
  }
  VnetGwTunnelBWThreshold: {
    value: '1'
  }
  VnetGwTunnelEgressAlertSeverity: {
    value: '0'
  }
  VnetGwTunnelEgressWindowSize: {
    value: 'PT5M'
  }
  VnetGwTunnelEgressEvaluationFrequency: {
    value: 'PT5M'
  }
  VnetGwTunnelEgressPolicyEffect: {
    value: 'disabled'
  }
  VnetGwTunnelEgressAlertState: {
    value: 'true'
  }
  VnetGwTunnelEgressThreshold: {
    value: '1'
  }
  VnetGwTunnelIngressAlertSeverity: {
    value: '0'
  }
  VnetGwTunnelIngressWindowSize: {
    value: 'PT5M'
  }
  VnetGwTunnelIngressEvaluationFrequency: {
    value: 'PT5M'
  }
  VnetGwTunnelIngressPolicyEffect: {
    value: 'disabled'
  }
  VnetGwTunnelIngressAlertState: {
    value: 'true'
  }
  VnetGwTunnelIngressThreshold: {
    value: '1'
  }
  VPNGWBandWidthUtilAlertSeverity: {
    value: '0'
  }
  VPNGWBandWidthUtilWindowSize: {
    value: 'PT5M'
  }
  VPNGWBandWidthUtilEvaluationFrequency: {
    value: 'PT5M'
  }
  VPNGWBandWidthUtilPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VPNGWBandWidthUtilAlertState: {
    value: 'true'
  }
  VPNGWBandWidthUtilThreshold: {
    value: '1'
  }
  VPNGWEgressAlertSeverity: {
    value: '0'
  }
  VPNGWEgressWindowSize: {
    value: 'PT5M'
  }
  VPNGWEgressEvaluationFrequency: {
    value: 'PT5M'
  }
  VPNGWEgressPolicyEffect: {
    value: 'disabled'
  }
  VPNGWEgressAlertState: {
    value: 'true'
  }
  VPNGWEgressThreshold: {
    value: '1'
  }
  VPNGWTunnelEgressPacketDropCountAlertSeverity: {
    value: '3'
  }
  VPNGWTunnelEgressPacketDropCountWindowSize: {
    value: 'PT5M'
  }
  VPNGWTunnelEgressPacketDropCountFrequency: {
    value: 'PT5M'
  }
  VPNGWTunnelEgressPacketDropCountPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VPNGWTunnelEgressPacketDropCountAlertState: {
    value: 'true'
  }
  VPNGWTunnelEgressPacketDropMismatchAlertSeverity: {
    value: '3'
  }
  VPNGWTunnelEgressPacketDropMismatchWindowSize: {
    value: 'PT5M'
  }
  VPNGWTunnelEgressPacketDropMismatchFrequency: {
    value: 'PT5M'
  }
  VPNGWTunnelEgressPacketDropMismatchPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VPNGWTunnelEgressPacketDropMismatchAlertState: {
    value: 'true'
  }
  VPNGWIngressAlertSeverity: {
    value: '0'
  }
  VPNGWIngressWindowSize: {
    value: 'PT5M'
  }
  VPNGWIngressEvaluationFrequency: {
    value: 'PT5M'
  }
  VPNGWIngressPolicyEffect: {
    value: 'disabled'
  }
  VPNGWIngressAlertState: {
    value: 'true'
  }
  VPNGWIngressThreshold: {
    value: '1'
  }
  VPNGWIngressAutoMitigate: {
    value: 'true'
  }
  VPNGWTunnelIngressPacketDropCountAlertSeverity: {
    value: '3'
  }
  VPNGWTunnelIngressPacketDropCountWindowSize: {
    value: 'PT5M'
  }
  VPNGWTunnelIngressPacketDropCountFrequency: {
    value: 'PT5M'
  }
  VPNGWTunnelIngressPacketDropCountPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VPNGWTunnelIngressPacketDropCountAlertState: {
    value: 'true'
  }
  VPNGWTunnelIngressPacketDropMismatchAlertSeverity: {
    value: '3'
  }
  VPNGWTunnelIngressPacketDropMismatchWindowSize: {
    value: 'PT5M'
  }
  VPNGWTunnelIngressPacketDropMismatchFrequency: {
    value: 'PT5M'
  }
  VPNGWTunnelIngressPacketDropMismatchPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VPNGWTunnelIngressPacketDropMismatchAlertState: {
    value: 'true'
  }
  PDNSZCapacityUtilAlertSeverity: {
    value: '2'
  }
  PDNSZCapacityUtilWindowSize: {
    value: 'PT1H'
  }
  PDNSZCapacityUtilEvaluationFrequency: {
    value: 'PT1H'
  }
  PDNSZCapacityUtilPolicyEffect: {
    value: 'deployIfNotExists'
  }
  PDNSZCapacityUtilAlertState: {
    value: 'true'
  }
  PDNSZCapacityUtilThreshold: {
    value: '80'
  }
  PDNSZQueryVolumeAlertSeverity: {
    value: '4'
  }
  PDNSZQueryVolumeWindowSize: {
    value: 'PT1H'
  }
  PDNSZQueryVolumeEvaluationFrequency: {
    value: 'PT1H'
  }
  PDNSZQueryVolumePolicyEffect: {
    value: 'disabled'
  }
  PDNSZQueryVolumeAlertState: {
    value: 'true'
  }
  PDNSZQueryVolumeThreshold: {
    value: '500'
  }
  PDNSZRecordSetCapacityAlertSeverity: {
    value: '2'
  }
  PDNSZRecordSetCapacityWindowSize: {
    value: 'PT1H'
  }
  PDNSZRecordSetCapacityEvaluationFrequency: {
    value: 'PT1H'
  }
  PDNSZRecordSetCapacityPolicyEffect: {
    value: 'deployIfNotExists'
  }
  PDNSZRecordSetCapacityAlertState: {
    value: 'true'
  }
  PDNSZRecordSetCapacityThreshold: {
    value: '80'
  }
  PDNSZRegistrationCapacityUtilAlertSeverity: {
    value: '2'
  }
  PDNSZRegistrationCapacityUtilWindowSize: {
    value: 'PT1H'
  }
  PDNSZRegistrationCapacityUtilEvaluationFrequency: {
    value: 'PT1H'
  }
  PDNSZRegistrationCapacityUtilPolicyEffect: {
    value: 'deployIfNotExists'
  }
  PDNSZRegistrationCapacityUtilAlertState: {
    value: 'true'
  }
  PDNSZRegistrationCapacityUtilThreshold: {
    value: '80'
  }
  PIPDDoSAttackAlertSeverity: {
    value: '1'
  }
  PIPDDoSAttackWindowSize: {
    value: 'PT5M'
  }
  PIPDDoSAttackEvaluationFrequency: {
    value: 'PT5M'
  }
  PIPDDoSAttackPolicyEffect: {
    value: 'deployIfNotExists'
  }
  PIPDDoSAttackAlertState: {
    value: 'true'
  }
  PIPDDoSAttackThreshold: {
    value: '0'
  }
  PIPPacketsInDDoSAlertSeverity: {
    value: '4'
  }
  PIPPacketsInDDoSWindowSize: {
    value: 'PT5M'
  }
  PIPPacketsInDDoSEvaluationFrequency: {
    value: 'PT5M'
  }
  PIPPacketsInDDoSPolicyEffect: {
    value: 'disabled'
  }
  PIPPacketsInDDoSAlertState: {
    value: 'true'
  }
  PIPPacketsInDDoSThreshold: {
    value: '40000'
  }
  PIPVIPAvailabilityAlertSeverity: {
    value: '1'
  }
  PIPVIPAvailabilityWindowSize: {
    value: 'PT5M'
  }
  PIPVIPAvailabilityEvaluationFrequency: {
    value: 'PT1M'
  }
  PIPVIPAvailabilityPolicyEffect: {
    value: 'deployIfNotExists'
  }
  PIPVIPAvailabilityAlertState: {
    value: 'true'
  }
  PIPVIPAvailabilityThreshold: {
    value: '1'
  }
  PIPBytesInDDoSAlertSeverity: {
    value: '4'
  }
  PIPBytesInDDoSWindowSize: {
    value: 'PT5M'
  }
  PIPBytesInDDoSEvaluationFrequency: {
    value: 'PT5M'
  }
  PIPBytesInDDoSPolicyEffect: {
    value: 'disabled'
  }
  PIPBytesInDDoSAlertState: {
    value: 'true'
  }
  PIPBytesInDDoSThreshold: {
    value: '8000000'
  }
  ERGwExpressRouteBitsInAlertSeverity: {
    value: '0'
  }
  ERGwExpressRouteBitsInWindowSize: {
    value: 'PT5M'
  }
  ERGwExpressRouteBitsInEvaluationFrequency: {
    value: 'PT5M'
  }
  ERGwExpressRouteBitsInPolicyEffect: {
    value: 'disabled'
  }
  ERGwExpressRouteBitsInAlertState: {
    value: 'true'
  }
  ERGwExpressRouteBitsInThreshold: {
    value: '1'
  }
  ERGwExpressRouteBitsOutAlertSeverity: {
    value: '0'
  }
  ERGwExpressRouteBitsOutWindowSize: {
    value: 'PT5M'
  }
  ERGwExpressRouteBitsOutEvaluationFrequency: {
    value: 'PT5M'
  }
  ERGwExpressRouteBitsOutPolicyEffect: {
    value: 'disabled'
  }
  ERGwExpressRouteBitsOutAlertState: {
    value: 'true'
  }
  ERGwExpressRouteBitsOutThreshold: {
    value: '1'
  }
  ERGwExpressRouteCpuUtilAlertSeverity: {
    value: '1'
  }
  ERGwExpressRouteCpuUtilWindowSize: {
    value: 'PT5M'
  }
  ERGwExpressRouteCpuUtilEvaluationFrequency: {
    value: 'PT1M'
  }
  ERGwExpressRouteCpuUtilPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERGwExpressRouteCpuUtilAlertState: {
    value: 'true'
  }
  ERGwExpressRouteCpuUtilThreshold: {
    value: '80'
  }
  VNETDDOSAttackAlertSeverity: {
    value: '1'
  }
  VNETDDOSAttackWindowSize: {
    value: 'PT5M'
  }
  VNETDDOSAttackEvaluationFrequency: {
    value: 'PT1M'
  }
  VNETDDOSAttackPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VNETDDOSAttackAlertState: {
    value: 'true'
  }
  VNETDDOSAttackThreshold: {
    value: '1'
  }
  VnetGwTunnelEgressPacketDropCountAlertSeverity: {
    value: '1'
  }
  VnetGwTunnelEgressPacketDropCountWindowSize: {
    value: 'PT5M'
  }
  VnetGwTunnelEgressPacketDropCountEvaluationFrequency: {
    value: 'PT5M'
  }
  VnetGwTunnelEgressPacketDropCountPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VnetGwTunnelEgressPacketDropCountAlertState: {
    value: 'true'
  }
  VnetGwTunnelEgressPacketDropMismatchAlertSeverity: {
    value: '3'
  }
  VnetGwTunnelEgressPacketDropMismatchWindowSize: {
    value: 'PT5M'
  }
  VnetGwTunnelEgressPacketDropMismatchEvaluationFrequency: {
    value: 'PT5M'
  }
  VnetGwTunnelEgressPacketDropMismatchPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VnetGwTunnelEgressPacketDropMismatchAlertState: {
    value: 'true'
  }
  VnetGwExpressRouteBitsPerSecondAlertSeverity: {
    value: '0'
  }
  VnetGwExpressRouteBitsPerSecondWindowSize: {
    value: 'PT5M'
  }
  VnetGwExpressRouteBitsPerSecondEvaluationFrequency: {
    value: 'PT1M'
  }
  VnetGwExpressRouteBitsPerSecondPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VnetGwExpressRouteBitsPerSecondAlertState: {
    value: 'true'
  }
  VnetGwExpressRouteBitsPerSecondThreshold: {
    value: '1'
  }
  VnetGwTunnelIngressPacketDropMismatchAlertSeverity: {
    value: '3'
  }
  VnetGwTunnelIngressPacketDropMismatchWindowSize: {
    value: 'PT5M'
  }
  VnetGwTunnelIngressPacketDropMismatchEvaluationFrequency: {
    value: 'PT5M'
  }
  VnetGwTunnelIngressPacketDropMismatchPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VnetGwTunnelIngressPacketDropMismatchAlertState: {
    value: 'true'
  }
  VnetGwTunnelIngressPacketDropCountAlertSeverity: {
    value: '3'
  }
  VnetGwTunnelIngressPacketDropCountWindowSize: {
    value: 'PT5M'
  }
  VnetGwTunnelIngressPacketDropCountEvaluationFrequency: {
    value: 'PT5M'
  }
  VnetGwTunnelIngressPacketDropCountPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VnetGwTunnelIngressPacketDropCountAlertState: {
    value: 'true'
  }
  ERCIRBgpAvailabilityAlertSeverity: {
    value: '0'
  }
  ERCIRBgpAvailabilityWindowSize: {
    value: 'PT5M'
  }
  ERCIRBgpAvailabilityEvaluationFrequency: {
    value: 'PT1M'
  }
  ERCIRBgpAvailabilityPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERCIRBgpAvailabilityAlertState: {
    value: 'true'
  }
  ERCIRBgpAvailabilityThreshold: {
    value: '90'
  }
  ERCIRArpAvailabilityAlertSeverity: {
    value: '0'
  }
  ERCIRArpAvailabilityWindowSize: {
    value: 'PT5M'
  }
  ERCIRArpAvailabilityFrequency: {
    value: 'PT1M'
  }
  ERCIRArpAvailabilityPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERCIRArpAvailabilityAlertState: {
    value: 'true'
  }
  ERCIRArpAvailabilityThreshold: {
    value: '90'
  }
  AFWSNATPortUtilizationAlertSeverity: {
    value: '1'
  }
  AFWSNATPortUtilizationWindowSize: {
    value: 'PT5M'
  }
  AFWSNATPortUtilizationFrequency: {
    value: 'PT1M'
  }
  AFWSNATPortUtilizationPolicyEffect: {
    value: 'deployIfNotExists'
  }
  AFWSNATPortUtilizationAlertState: {
    value: 'true'
  }
  AFWSNATPortUtilizationThreshold: {
    value: '80'
  }
  FirewallHealthAlertSeverity: {
    value: '0'
  }
  FirewallHealthWindowSize: {
    value: 'PT5M'
  }
  FirewallHealthEvaluationFrequency: {
    value: 'PT1M'
  }
  FirewallHealthPolicyEffect: {
    value: 'deployIfNotExists'
  }
  FirewallHealthAlertState: {
    value: 'true'
  }
  FirewallHealthThreshold: {
    value: '90'
  }
  activityFWDeleteAlertState: {
    value: 'true'
  }
  activityNSGDeleteAlertState: {
    value: 'true'
  }
  activityUDRUpdateAlertState: {
    value: 'true'
  }
  activityVPNGWDeleteAlertState: {
    value: 'true'
  }
  LBDatapathAvailabilityAlertSeverity: {
    value: '0'
  }
  LBDatapathAvailabilityWindowSize: {
    value: 'PT5M'
  }
  LBDatapathAvailabilityEvaluationFrequency: {
    value: 'PT1M'
  }
  LBDatapathAvailabilityPolicyEffect: {
    value: 'deployIfNotExists'
  }
  LBDatapathAvailabilityAlertState: {
    value: 'true'
  }
  LBGlobalBackendAvailabilityAlertSeverity: {
    value: '0'
  }
  LBGlobalBackendAvailabilityWindowSize: {
    value: 'PT5M'
  }
  LBGlobalBackendAvailabilityEvaluationFrequency: {
    value: 'PT1M'
  }
  LBGlobalBackendAvailabilityPolicyEffect: {
    value: 'deployIfNotExists'
  }
  LBGlobalBackendAvailabilityAlertState: {
    value: 'true'
  }
  LBHealthProbeStatusAlertSeverity: {
    value: '2'
  }
  LBHealthProbeStatusWindowSize: {
    value: 'PT5M'
  }
  LBHealthProbeStatusEvaluationFrequency: {
    value: 'PT1M'
  }
  LBHealthProbeStatusPolicyEffect: {
    value: 'deployIfNotExists'
  }
  LBHealthProbeStatusAlertState: {
    value: 'true'
  }
  LBUsedSNATPortsAlertSeverity: {
    value: '1'
  }
  LBUsedSNATPortsWindowSize: {
    value: 'PT5M'
  }
  LBUsedSNATPortsEvaluationFrequency: {
    value: 'PT1M'
  }
  LBUsedSNATPortsPolicyEffect: {
    value: 'deployIfNotExists'
  }
  LBUsedSNATPortsAlertState: {
    value: 'true'
  }
  ERPBitsInPerSecondAlertSeverity: {
    value: '0'
  }
  ERPBitsInPerSecondWindowSize: {
    value: 'PT5M'
  }
  ERPBitsInPerSecondEvaluationFrequency: {
    value: 'PT1M'
  }
  ERPBitsInPerSecondPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERPBitsInPerSecondAlertState: {
    value: 'true'
  }
  ERPBitsOutPerSecondAlertSeverity: {
    value: '0'
  }
  ERPBitsOutPerSecondWindowSize: {
    value: 'PT5M'
  }
  ERPBitsOutPerSecondEvaluationFrequency: {
    value: 'PT1M'
  }
  ERPBitsOutPerSecondPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERPBitsOutPerSecondAlertState: {
    value: 'true'
  }
  ERPLineProtocolAlertSeverity: {
    value: '0'
  }
  ERPLineProtocolWindowSize: {
    value: 'PT5M'
  }
  ERPLineProtocolEvaluationFrequency: {
    value: 'PT1M'
  }
  ERPLineProtocolPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERPLineProtocolAlertState: {
    value: 'true'
  }
  ERPRxLightLevelHighAlertSeverity: {
    value: '1'
  }
  ERPRxLightLevelHighWindowSize: {
    value: 'PT5M'
  }
  ERPRxLightLevelHighEvaluationFrequency: {
    value: 'PT1M'
  }
  ERPRxLightLevelHighPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERPRxLightLevelHighAlertState: {
    value: 'true'
  }
  ERPRxLightLevelLowAlertSeverity: {
    value: '1'
  }
  ERPRxLightLevelLowWindowSize: {
    value: 'PT5M'
  }
  ERPRxLightLevelLowEvaluationFrequency: {
    value: 'PT1M'
  }
  ERPRxLightLevelLowPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERPRxLightLevelLowAlertState: {
    value: 'true'
  }
  ERPTxLightLevelHighAlertSeverity: {
    value: '1'
  }
  ERPTxLightLevelHighWindowSize: {
    value: 'PT5M'
  }
  ERPTxLightLevelHighEvaluationFrequency: {
    value: 'PT1M'
  }
  ERPTxLightLevelHighPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERPTxLightLevelHighAlertState: {
    value: 'true'
  }
  ERPTxLightLevelLowAlertSeverity: {
    value: '1'
  }
  ERPTxLightLevelLowWindowSize: {
    value: 'PT5M'
  }
  ERPTxLightLevelLowEvaluationFrequency: {
    value: 'PT1M'
  }
  ERPTxLightLevelLowPolicyEffect: {
    value: 'deployIfNotExists'
  }
  ERPTxLightLevelLowAlertState: {
    value: 'true'
  }
}

param policyAssignmentParametersIdentity = {
  KVRequestAlertSeverity: {
    value: '2'
  }
  KVRequestWindowSize: {
    value: 'PT5M'
  }
  KVRequestEvaluationFrequency: {
    value: 'PT5M'
  }
  KVRequestPolicyEffect: {
    value: 'disabled'
  }
  KVRequestAlertState: {
    value: 'true'
  }
  KvAvailabilityAlertSeverity: {
    value: '1'
  }
  KvAvailabilityWindowSize: {
    value: 'PT1M'
  }
  KvAvailabilityEvaluationFrequency: {
    value: 'PT1M'
  }
  KvAvailabilityPolicyEffect: {
    value: 'disabled'
  }
  KvAvailabilityAlertState: {
    value: 'true'
  }
  KVAvailabilityThreshold: {
    value: '20'
  }
  KvLatencyAvailabilityAlertSeverity: {
    value: '3'
  }
  KvLatencyAvailabilityWindowSize: {
    value: 'PT5M'
  }
  KvLatencyAvailabilityEvaluationFrequency: {
    value: 'PT5M'
  }
  KvLatencyAvailabilityPolicyEffect: {
    value: 'disabled'
  }
  KvLatencyAvailabilityAlertState: {
    value: 'true'
  }
  KvLatencyAvailabilityThreshold: {
    value: '1000'
  }
  KVCapacityAlertSeverity: {
    value: '1'
  }
  KVCapacityWindowSize: {
    value: 'PT5M'
  }
  KVCapacityEvaluationFrequency: {
    value: 'PT1M'
  }
  KVCapacityPolicyEffect: {
    value: 'disabled'
  }
  KVCapacityAlertState: {
    value: 'true'
  }
  KVCapacityThreshold: {
    value: '75'
  }
  activityKVDeleteAlertState: {
    value: 'true'
  }
}

param policyAssignmentParametersLandingZone = {
  KVRequestAlertSeverity: {
    value: '2'
  }
  KVRequestWindowSize: {
    value: 'PT5M'
  }
  KVRequestEvaluationFrequency: {
    value: 'PT5M'
  }
  KVRequestPolicyEffect: {
    value: 'disabled'
  }
  KVRequestAlertState: {
    value: 'true'
  }
  KvAvailabilityAlertSeverity: {
    value: '1'
  }
  KvAvailabilityWindowSize: {
    value: 'PT1M'
  }
  KvAvailabilityEvaluationFrequency: {
    value: 'PT1M'
  }
  KvAvailabilityPolicyEffect: {
    value: 'disabled'
  }
  KvAvailabilityAlertState: {
    value: 'true'
  }
  KVAvailabilityThreshold: {
    value: '20'
  }
  KvLatencyAvailabilityAlertSeverity: {
    value: '3'
  }
  KvLatencyAvailabilityWindowSize: {
    value: 'PT5M'
  }
  KvLatencyAvailabilityEvaluationFrequency: {
    value: 'PT5M'
  }
  KvLatencyAvailabilityPolicyEffect: {
    value: 'disabled'
  }
  KvLatencyAvailabilityAlertState: {
    value: 'true'
  }
  KvLatencyAvailabilityThreshold: {
    value: '1000'
  }
  KVCapacityAlertSeverity: {
    value: '1'
  }
  KVCapacityWindowSize: {
    value: 'PT5M'
  }
  KVCapacityEvaluationFrequency: {
    value: 'PT1M'
  }
  KVCapacityPolicyEffect: {
    value: 'disabled'
  }
  KVCapacityAlertState: {
    value: 'true'
  }
  KVCapacityThreshold: {
    value: '75'
  }
  activityKVDeleteAlertState: {
    value: 'true'
  }
  StorageAccountAvailabilityAlertSeverity: {
    value: '1'
  }
  StorageAccountAvailabilityWindowSize: {
    value: 'PT5M'
  }
  StorageAccountAvailabilityFrequency: {
    value: 'PT5M'
  }
  StorageAccountAvailabilityPolicyEffect: {
    value: 'deployIfNotExists'
  }
  StorageAccountAvailabilityAlertState: {
    value: 'true'
  }
  StorageAccountAvailabilityThreshold: {
    value: '90'
  }
  StorageAccountDeletePolicyEffect: {
    value: 'deployIfNotExists'
  }
  StorageAccountDeleteAlertState: {
    value: 'true'
  }
  PIPDDoSAttackAlertSeverity: {
    value: '1'
  }
  PIPDDoSAttackWindowSize: {
    value: 'PT5M'
  }
  PIPDDoSAttackEvaluationFrequency: {
    value: 'PT5M'
  }
  PIPDDoSAttackPolicyEffect: {
    value: 'deployIfNotExists'
  }
  PIPDDoSAttackAlertState: {
    value: 'true'
  }
  PIPDDoSAttackThreshold: {
    value: '0'
  }
  PIPPacketsInDDoSAlertSeverity: {
    value: '4'
  }
  PIPPacketsInDDoSWindowSize: {
    value: 'PT5M'
  }
  PIPPacketsInDDoSEvaluationFrequency: {
    value: 'PT5M'
  }
  PIPPacketsInDDoSPolicyEffect: {
    value: 'disabled'
  }
  PIPPacketsInDDoSAlertState: {
    value: 'true'
  }
  PIPPacketsInDDoSThreshold: {
    value: '40000'
  }
  PIPVIPAvailabilityAlertSeverity: {
    value: '1'
  }
  PIPVIPAvailabilityWindowSize: {
    value: 'PT5M'
  }
  PIPVIPAvailabilityEvaluationFrequency: {
    value: 'PT1M'
  }
  PIPVIPAvailabilityPolicyEffect: {
    value: 'deployIfNotExists'
  }
  PIPVIPAvailabilityAlertState: {
    value: 'true'
  }
  PIPVIPAvailabilityThreshold: {
    value: '1'
  }
  PIPBytesInDDoSAlertSeverity: {
    value: '4'
  }
  PIPBytesInDDoSWindowSize: {
    value: 'PT5M'
  }
  PIPBytesInDDoSEvaluationFrequency: {
    value: 'PT5M'
  }
  PIPBytesInDDoSPolicyEffect: {
    value: 'disabled'
  }
  PIPBytesInDDoSAlertState: {
    value: 'true'
  }
  PIPBytesInDDoSThreshold: {
    value: '8000000'
  }
  RVBackupHealthMonitorPolicyEffect: {
    value: 'modify'
  }
  VNETDDOSAttackAlertSeverity: {
    value: '1'
  }
  VNETDDOSAttackWindowSize: {
    value: 'PT5M'
  }
  VNETDDOSAttackEvaluationFrequency: {
    value: 'PT1M'
  }
  VNETDDOSAttackPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VNETDDOSAttackAlertState: {
    value: 'true'
  }
  VNETDDOSAttackThreshold: {
    value: '1'
  }
  activityNSGDeleteAlertState: {
    value: 'true'
  }
  activityUDRUpdateAlertState: {
    value: 'true'
  }
  VMHeartBeatRGAlertSeverity: {
    value: '1'
  }
  VMHeartBeatRGWindowSize: {
    value: 'PT15M'
  }
  VMHeartBeatRGEvaluationFrequency: {
    value: 'PT5M'
  }
  VMHeartBeatRGAutoMitigate: {
    value: 'true'
  }
  VMHeartBeatRGAutoResolve: {
    value: 'true'
  }
  VMHeartBeatRGAutoResolveTime: {
    value: '00:10:00'
  }
  VMHeartBeatRGPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VMHeartBeatRGAlertState: {
    value: 'true'
  }
  VMHeartBeatRGThreshold: {
    value: '10'
  }
  VMHeartBeatRGOperator: {
    value: 'GreaterThan'
  }
  VMHeartBeatRGTimeAggregation: {
    value: 'Average'
  }
  VMNetworkInAlertSeverity: {
    value: '2'
  }
  VMNetworkInWindowSize: {
    value: 'PT15M'
  }
  VMNetworkInEvaluationFrequency: {
    value: 'PT5M'
  }
  VMNetworkInAutoMitigate: {
    value: 'true'
  }
  VMNetworkInAutoResolve: {
    value: 'true'
  }
  VMNetworkInAutoResolveTime: {
    value: '00:10:00'
  }
  VMNetworkInPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VMNetworkInAlertState: {
    value: 'true'
  }
  VMNetworkInThreshold: {
    value: '10000000'
  }
  VMNetworkInOperator: {
    value: 'GreaterThan'
  }
  VMNetworkInTimeAggregation: {
    value: 'Average'
  }
  VMNetworkInEvaluationPeriods: {
    value: '1'
  }
  VMNetworkInFailingPeriods: {
    value: '1'
  }
  VMNetworkInComputersToInclude: {
    value: [
      '*'
    ]
  }
  VMNetworkInNetworkInterfaceToInclude: {
    value: [
      '*'
    ]
  }
  VMNetworkOutAlertSeverity: {
    value: '2'
  }
  VMNetworkOutWindowSize: {
    value: 'PT15M'
  }
  VMNetworkOutEvaluationFrequency: {
    value: 'PT5M'
  }
  VMNetworkOutAutoMitigate: {
    value: 'true'
  }
  VMNetworkOutAutoResolve: {
    value: 'true'
  }
  VMNetworkOutAutoResolveTime: {
    value: '00:10:00'
  }
  VMNetworkOutPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VMNetworkOutAlertState: {
    value: 'true'
  }
  VMNetworkOutThreshold: {
    value: '10000000'
  }
  VMNetworkOutOperator: {
    value: 'GreaterThan'
  }
  VMNetworkOutTimeAggregation: {
    value: 'Average'
  }
  VMNetworkOutEvaluationPeriods: {
    value: '1'
  }
  VMNetworkOutFailingPeriods: {
    value: '1'
  }
  VMNetworkOutComputersToInclude: {
    value: [
      '*'
    ]
  }
  VMNetworkOutNetworkInterfaceToInclude: {
    value: [
      '*'
    ]
  }
  VMOSDiskReadLatencyAlertSeverity: {
    value: '2'
  }
  VMOSDiskReadLatencyWindowSize: {
    value: 'PT15M'
  }
  VMOSDiskReadLatencyEvaluationFrequency: {
    value: 'PT5M'
  }
  VMOSDiskReadLatencyAutoMitigate: {
    value: 'true'
  }
  VMOSDiskReadLatencyAutoResolve: {
    value: 'true'
  }
  VMOSDiskReadLatencyAutoResolveTime: {
    value: '00:10:00'
  }
  VMOSDiskReadLatencyPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VMOSDiskReadLatencyAlertState: {
    value: 'true'
  }
  VMOSDiskReadLatencyThreshold: {
    value: '30'
  }
  VMOSDiskReadLatencyOperator: {
    value: 'LessThan'
  }
  VMOSDiskReadLatencyTimeAggregation: {
    value: 'Average'
  }
  VMOSDiskReadLatencyEvaluationPeriods: {
    value: '1'
  }
  VMOSDiskReadLatencyFailingPeriods: {
    value: '1'
  }
  VMOSDiskReadLatencyComputersToInclude: {
    value: [
      '*'
    ]
  }
  VMOSDiskReadLatencyDisksToInclude: {
    value: [
      'C:'
      '/'
    ]
  }
  VMOSDiskWriteLatencyAlertSeverity: {
    value: '2'
  }
  VMOSDiskWriteLatencyWindowSize: {
    value: 'PT15M'
  }
  VMOSDiskWriteLatencyEvaluationFrequency: {
    value: 'PT5M'
  }
  VMOSDiskWriteLatencyAutoMitigate: {
    value: 'true'
  }
  VMOSDiskWriteLatencyAutoResolve: {
    value: 'true'
  }
  VMOSDiskWriteLatencyAutoResolveTime: {
    value: '00:10:00'
  }
  VMOSDiskWriteLatencyPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VMOSDiskWriteLatencyAlertState: {
    value: 'true'
  }
  VMOSDiskWriteLatencyThreshold: {
    value: '50'
  }
  VMOSDiskWriteLatencyOperator: {
    value: 'LessThan'
  }
  VMOSDiskWriteLatencyTimeAggregation: {
    value: 'Average'
  }
  VMOSDiskWriteLatencyEvaluationPeriods: {
    value: '1'
  }
  VMOSDiskWriteLatencyFailingPeriods: {
    value: '1'
  }
  VMOSDiskWriteLatencyComputersToInclude: {
    value: [
      '*'
    ]
  }
  VMOSDiskWriteLatencyDisksToInclude: {
    value: [
      'C:'
      '/'
    ]
  }
  VMOSDiskSpaceAlertSeverity: {
    value: '2'
  }
  VMOSDiskSpaceWindowSize: {
    value: 'PT15M'
  }
  VMOSDiskSpaceEvaluationFrequency: {
    value: 'PT5M'
  }
  VMOSDiskSpaceAutoMitigate: {
    value: 'true'
  }
  VMOSDiskSpaceAutoResolve: {
    value: 'true'
  }
  VMOSDiskSpaceAutoResolveTime: {
    value: '00:10:00'
  }
  VMOSDiskSpacePolicyEffect: {
    value: 'deployIfNotExists'
  }
  VMOSDiskSpaceAlertState: {
    value: 'true'
  }
  VMOSDiskSpaceThreshold: {
    value: '10'
  }
  VMOSDiskSpaceOperator: {
    value: 'LessThan'
  }
  VMOSDiskSpaceTimeAggregation: {
    value: 'Average'
  }
  VMOSDiskSpaceEvaluationPeriods: {
    value: '1'
  }
  VMOSDiskSpaceFailingPeriods: {
    value: '1'
  }
  VMOSDiskSpaceComputersToInclude: {
    value: [
      '*'
    ]
  }
  VMOSDiskSpaceDisksToInclude: {
    value: [
      'C:'
      '/'
    ]
  }
  VMPercentCPUAlertSeverity: {
    value: '2'
  }
  VMPercentCPUWindowSize: {
    value: 'PT15M'
  }
  VMPercentCPUEvaluationFrequency: {
    value: 'PT5M'
  }
  VMPercentCPUAutoMitigate: {
    value: 'true'
  }
  VMPercentCPUAutoResolve: {
    value: 'true'
  }
  VMPercentCPUAutoResolveTime: {
    value: '00:10:00'
  }
  VMPercentCPUPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VMPercentCPUAlertState: {
    value: 'true'
  }
  VMPercentCPUThreshold: {
    value: '85'
  }
  VMPercentCPUOperator: {
    value: 'GreaterThan'
  }
  VMPercentCPUTimeAggregation: {
    value: 'Average'
  }
  VMPercentMemoryAlertSeverity: {
    value: '2'
  }
  VMPercentMemoryWindowSize: {
    value: 'PT15M'
  }
  VMPercentMemoryEvaluationFrequency: {
    value: 'PT5M'
  }
  VMPercentMemoryAutoMitigate: {
    value: 'true'
  }
  VMPercentMemoryAutoResolve: {
    value: 'true'
  }
  VMPercentMemoryAutoResolveTime: {
    value: '00:10:00'
  }
  VMPercentMemoryPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VMPercentMemoryAlertState: {
    value: 'true'
  }
  VMPercentMemoryThreshold: {
    value: '10'
  }
  VMPercentMemoryOperator: {
    value: 'LessThan'
  }
  VMPercentMemoryTimeAggregation: {
    value: 'Average'
  }
  VMDataDiskSpaceAlertSeverity: {
    value: '2'
  }
  VMDataDiskSpaceWindowSize: {
    value: 'PT15M'
  }
  VMDataDiskSpaceEvaluationFrequency: {
    value: 'PT5M'
  }
  VMDataDiskSpaceAutoMitigate: {
    value: 'true'
  }
  VMDataDiskSpaceAutoResolve: {
    value: 'true'
  }
  VMDataDiskSpaceAutoResolveTime: {
    value: '00:10:00'
  }
  VMDataDiskSpacePolicyEffect: {
    value: 'deployIfNotExists'
  }
  VMDataDiskSpaceAlertState: {
    value: 'true'
  }
  VMDataDiskSpaceThreshold: {
    value: '10'
  }
  VMDataDiskSpaceOperator: {
    value: 'LessThan'
  }
  VMDataDiskSpaceTimeAggregation: {
    value: 'Average'
  }
  VMDataDiskSpaceEvaluationPeriods: {
    value: '1'
  }
  VMDataDiskSpaceFailingPeriods: {
    value: '1'
  }
  VMDataDiskSpaceDisksToInclude: {
    value: [
      '*'
    ]
  }
  VMDataDiskReadLatencyAlertSeverity: {
    value: '2'
  }
  VMDataDiskReadLatencyWindowSize: {
    value: 'PT15M'
  }
  VMDataDiskReadLatencyEvaluationFrequency: {
    value: 'PT5M'
  }
  VMDataDiskReadLatencyAutoMitigate: {
    value: 'true'
  }
  VMDataDiskReadLatencyAutoResolve: {
    value: 'true'
  }
  VMDataDiskReadLatencyAutoResolveTime: {
    value: '00:10:00'
  }
  VMDataDiskReadLatencyPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VMDataDiskReadLatencyAlertState: {
    value: 'true'
  }
  VMDataDiskReadLatencyThreshold: {
    value: '30'
  }
  VMDataDiskReadLatencyOperator: {
    value: 'LessThan'
  }
  VMDataDiskReadLatencyTimeAggregation: {
    value: 'Average'
  }
  VMDataDiskReadLatencyEvaluationPeriods: {
    value: '1'
  }
  VMDataDiskReadLatencyFailingPeriods: {
    value: '1'
  }
  VMDataDiskReadLatencyComputersToInclude: {
    value: [
      '*'
    ]
  }
  VMDataDiskReadLatencyDisksToInclude: {
    value: [
      '*'
    ]
  }
  VMDataDiskWriteLatencyAlertSeverity: {
    value: '2'
  }
  VMDataDiskWriteLatencyWindowSize: {
    value: 'PT15M'
  }
  VMDataDiskWriteLatencyEvaluationFrequency: {
    value: 'PT5M'
  }
  VMDataDiskWriteLatencyAutoMitigate: {
    value: 'true'
  }
  VMDataDiskWriteLatencyAutoResolve: {
    value: 'true'
  }
  VMDataDiskWriteLatencyAutoResolveTime: {
    value: '00:10:00'
  }
  VMDataDiskWriteLatencyPolicyEffect: {
    value: 'deployIfNotExists'
  }
  VMDataDiskWriteLatencyAlertState: {
    value: 'true'
  }
  VMDataDiskWriteLatencyThreshold: {
    value: '30'
  }
  VMDataDiskWriteLatencyOperator: {
    value: 'LessThan'
  }
  VMDataDiskWriteLatencyTimeAggregation: {
    value: 'Average'
  }
  VMDataDiskWriteLatencyEvaluationPeriods: {
    value: '1'
  }
  VMDataDiskWriteLatencyFailingPeriods: {
    value: '1'
  }
  VMDataDiskWriteLatencyComputersToInclude: {
    value: [
      '*'
    ]
  }
  VMDataDiskWriteLatencyDisksToInclude: {
    value: [
      '*'
    ]
  }
  AGWApplicationGatewayTotalTimeAlertSeverity: {
    value: '2'
  }
  AGWApplicationGatewayTotalTimeWindowSize: {
    value: 'PT5M'
  }
  AGWApplicationGatewayTotalTimeEvaluationFrequency: {
    value: 'PT1M'
  }
  AGWApplicationGatewayTotalTimePolicyEffect: {
    value: 'deployIfNotExists'
  }
  AGWApplicationGatewayTotalTimeAlertState: {
    value: 'true'
  }
  AGWBackendLastByteResponseTimeAlertSeverity: {
    value: '2'
  }
  AGWBackendLastByteResponseTimeWindowSize: {
    value: 'PT5M'
  }
  AGWBackendLastByteResponseTimeEvaluationFrequency: {
    value: 'PT1M'
  }
  AGWBackendLastByteResponseTimePolicyEffect: {
    value: 'deployIfNotExists'
  }
  AGWBackendLastByteResponseTimeAlertState: {
    value: 'true'
  }
  AGWCapacityUnitsAlertSeverity: {
    value: '2'
  }
  AGWCapacityUnitsWindowSize: {
    value: 'PT5M'
  }
  AGWCapacityUnitsEvaluationFrequency: {
    value: 'PT1M'
  }
  AGWCapacityUnitsPolicyEffect: {
    value: 'deployIfNotExists'
  }
  AGWCapacityUnitsAlertState: {
    value: 'true'
  }
  AGWComputeUnitsAlertSeverity: {
    value: '2'
  }
  AGWComputeUnitsWindowSize: {
    value: 'PT5M'
  }
  AGWComputeUnitsEvaluationFrequency: {
    value: 'PT1M'
  }
  AGWComputeUnitsPolicyEffect: {
    value: 'deployIfNotExists'
  }
  AGWComputeUnitsAlertState: {
    value: 'true'
  }
  AGWCPUUtilAlertSeverity: {
    value: '2'
  }
  AGWCPUUtilWindowSize: {
    value: 'PT5M'
  }
  AGWCPUUtilEvaluationFrequency: {
    value: 'PT1M'
  }
  AGWCPUUtilPolicyEffect: {
    value: 'deployIfNotExists'
  }
  AGWCPUUtilAlertState: {
    value: 'true'
  }
  AGWFailedRequestsAlertSeverity: {
    value: '2'
  }
  AGWFailedRequestsWindowSize: {
    value: 'PT5M'
  }
  AGWFailedRequestsEvaluationFrequency: {
    value: 'PT1M'
  }
  AGWFailedRequestsPolicyEffect: {
    value: 'deployIfNotExists'
  }
  AGWFailedRequestsAlertState: {
    value: 'true'
  }
  AGWResponseStatusAlertSeverity: {
    value: '2'
  }
  AGWResponseStatusWindowSize: {
    value: 'PT5M'
  }
  AGWResponseStatusEvaluationFrequency: {
    value: 'PT1M'
  }
  AGWResponseStatusPolicyEffect: {
    value: 'deployIfNotExists'
  }
  AGWResponseStatusAlertState: {
    value: 'true'
  }
  AGWUnhealthyHostCountAlertSeverity: {
    value: '2'
  }
  AGWUnhealthyHostCountWindowSize: {
    value: 'PT5M'
  }
  AGWUnhealthyHostCountEvaluationFrequency: {
    value: 'PT1M'
  }
  AGWUnhealthyHostCountPolicyEffect: {
    value: 'deployIfNotExists'
  }
  AGWUnhealthyHostCountAlertState: {
    value: 'true'
  }
  LBDatapathAvailabilityAlertSeverity: {
    value: '0'
  }
  LBDatapathAvailabilityWindowSize: {
    value: 'PT5M'
  }
  LBDatapathAvailabilityEvaluationFrequency: {
    value: 'PT1M'
  }
  LBDatapathAvailabilityPolicyEffect: {
    value: 'deployIfNotExists'
  }
  LBDatapathAvailabilityAlertState: {
    value: 'true'
  }
  LBGlobalBackendAvailabilityAlertSeverity: {
    value: '0'
  }
  LBGlobalBackendAvailabilityWindowSize: {
    value: 'PT5M'
  }
  LBGlobalBackendAvailabilityEvaluationFrequency: {
    value: 'PT1M'
  }
  LBGlobalBackendAvailabilityPolicyEffect: {
    value: 'deployIfNotExists'
  }
  LBGlobalBackendAvailabilityAlertState: {
    value: 'true'
  }
  LBHealthProbeStatusAlertSeverity: {
    value: '2'
  }
  LBHealthProbeStatusWindowSize: {
    value: 'PT5M'
  }
  LBHealthProbeStatusEvaluationFrequency: {
    value: 'PT1M'
  }
  LBHealthProbeStatusPolicyEffect: {
    value: 'deployIfNotExists'
  }
  LBHealthProbeStatusAlertState: {
    value: 'true'
  }
  LBUsedSNATPortsAlertSeverity: {
    value: '1'
  }
  LBUsedSNATPortsWindowSize: {
    value: 'PT5M'
  }
  LBUsedSNATPortsEvaluationFrequency: {
    value: 'PT1M'
  }
  LBUsedSNATPortsPolicyEffect: {
    value: 'deployIfNotExists'
  }
  LBUsedSNATPortsAlertState: {
    value: 'true'
  }
  TMEndpointHealthAlertSeverity: {
    value: '2'
  }
  TMEndpointHealthWindowSize: {
    value: 'PT5M'
  }
  TMEndpointHealthEvaluationFrequency: {
    value: 'PT1M'
  }
  TMEndpointHealthPolicyEffect: {
    value: 'deployIfNotExists'
  }
  TMEndpointHealthAlertState: {
    value: 'true'
  }
  WSFCPUPercentageAlertSeverity: {
    value: '2'
  }
  WSFCPUPercentageWindowSize: {
    value: 'PT5M'
  }
  WSFCPUPercentageEvaluationFrequency: {
    value: 'PT1M'
  }
  WSFCPUPercentagePolicyEffect: {
    value: 'deployIfNotExists'
  }
  WSFCPUPercentageAlertState: {
    value: 'true'
  }
  WSFMemoryPercentageAlertSeverity: {
    value: '2'
  }
  WSFMemoryPercentageWindowSize: {
    value: 'PT5M'
  }
  WSFMemoryPercentageEvaluationFrequency: {
    value: 'PT1M'
  }
  WSFMemoryPercentagePolicyEffect: {
    value: 'deployIfNotExists'
  }
  WSFMemoryPercentageAlertState: {
    value: 'true'
  }
  WSFDiskQueueLengthAlertSeverity: {
    value: '2'
  }
  WSFDiskQueueLengthWindowSize: {
    value: 'PT5M'
  }
  WSFDiskQueueLengthEvaluationFrequency: {
    value: 'PT1M'
  }
  WSFDiskQueueLengthPolicyEffect: {
    value: 'deployIfNotExists'
  }
  WSFDiskQueueLengthAlertState: {
    value: 'true'
  }
  WSFHttpQueueLengthAlertSeverity: {
    value: '2'
  }
  WSFHttpQueueLengthWindowSize: {
    value: 'PT5M'
  }
  WSFHttpQueueLengthEvaluationFrequency: {
    value: 'PT1M'
  }
  WSFHttpQueueLengthPolicyEffect: {
    value: 'deployIfNotExists'
  }
  WSFHttpQueueLengthAlertState: {
    value: 'true'
  }
  CDNPOriginHealthPercentageAlertSeverity: {
    value: '2'
  }
  CDNPOriginHealthPercentageWindowSize: {
    value: 'PT5M'
  }
  CDNPOriginHealthPercentageEvaluationFrequency: {
    value: 'PT1M'
  }
  CDNPOriginHealthPercentagePolicyEffect: {
    value: 'deployIfNotExists'
  }
  CDNPOriginHealthPercentageAlertState: {
    value: 'true'
  }
  CDNPOriginLatencyAlertSeverity: {
    value: '2'
  }
  CDNPOriginLatencyWindowSize: {
    value: 'PT5M'
  }
  CDNPOriginLatencyEvaluationFrequency: {
    value: 'PT1M'
  }
  CDNPOriginLatencyPolicyEffect: {
    value: 'disabled'
  }
  CDNPOriginLatencyAlertState: {
    value: 'true'
  }
  CDNPPercentage4XXAlertSeverity: {
    value: '2'
  }
  CDNPPercentage4XXWindowSize: {
    value: 'PT5M'
  }
  CDNPPercentage4XXEvaluationFrequency: {
    value: 'PT1M'
  }
  CDNPPercentage4XXPolicyEffect: {
    value: 'deployIfNotExists'
  }
  CDNPPercentage4XXAlertState: {
    value: 'true'
  }
  CDNPPercentage5XXAlertSeverity: {
    value: '2'
  }
  CDNPPercentage5XXWindowSize: {
    value: 'PT5M'
  }
  CDNPPercentage5XXEvaluationFrequency: {
    value: 'PT1M'
  }
  CDNPPercentage5XXPolicyEffect: {
    value: 'deployIfNotExists'
  }
  CDNPPercentage5XXAlertState: {
    value: 'true'
  }
  FDBackendHealthAlertSeverity: {
    value: '2'
  }
  FDBackendHealthWindowSize: {
    value: 'PT5M'
  }
  FDBackendHealthEvaluationFrequency: {
    value: 'PT1M'
  }
  FDBackendHealthPolicyEffect: {
    value: 'deployIfNotExists'
  }
  FDBackendHealthAlertState: {
    value: 'true'
  }
  FDBackendRequestLatencyAlertSeverity: {
    value: '2'
  }
  FDBackendRequestLatencyWindowSize: {
    value: 'PT5M'
  }
  FDBackendRequestLatencyEvaluationFrequency: {
    value: 'PT1M'
  }
  FDBackendRequestLatencyPolicyEffect: {
    value: 'deployIfNotExists'
  }
  FDBackendRequestLatencyAlertState: {
    value: 'true'
  }
}

param policyAssignmentParametersManagement = {
  AATotalJobAlertSeverity: {
    value: '2'
  }
  AATotalJobAlertWindowSize: {
    value: 'PT5M'
  }
  AATotalJobAlertEvaluationFrequency: {
    value: 'PT1M'
  }
  AATotalJobAlertPolicyEffect: {
    value: 'deployIfNotExists'
  }
  AATotalJobAlertAlertState: {
    value: 'true'
  }
  AATotalJobAlertThreshold: {
    value: '20'
  }
  RVBackupHealthMonitorPolicyEffect: {
    value: 'modify'
  }
  StorageAccountAvailabilityAlertSeverity: {
    value: '1'
  }
  StorageAccountAvailabilityWindowSize: {
    value: 'PT5M'
  }
  StorageAccountAvailabilityFrequency: {
    value: 'PT5M'
  }
  StorageAccountAvailabilityPolicyEffect: {
    value: 'deployIfNotExists'
  }
  StorageAccountAvailabilityAlertState: {
    value: 'true'
  }
  StorageAccountAvailabilityThreshold: {
    value: '90'
  }
  StorageAccountDeletePolicyEffect: {
    value: 'deployIfNotExists'
  }
  StorageAccountDeleteAlertState: {
    value: 'true'
  }
  activityLAWDeleteAlertState: {
    value: 'true'
  }
  activityLAWKeyRegenAlertState: {
    value: 'true'
  }
}
