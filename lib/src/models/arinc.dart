
class ADSApplicationDataType {
  static const Acknowledgement = 3;
  static const NegativeAcknowledgement = 4;
  static const NoncomplianceNotification = 5;
  static const CancelEmergencyMode = 6;
  static const BasicReport = 7;
  static const EmergencyBasicReport = 9;
  static const LateralDeviationChangeEvent = 10;
  static const FlightIdentificationGroup = 12;
  static const PredictedRouteGroup = 13;
  static const EarthReferenceGroup = 14;
  static const AirReferenceGroup = 15;
  static const MeteorologicalGroup = 16;
  static const AirframeIdentificationGroup = 17;
  static const VerticalRateChangeEvent = 18;
  static const AltitudeRangeEvent = 19;
  static const WaypointChangeEvent = 20;
  static const IntermediateProjectedIntentGroup = 22;
  static const FixedProjectedIntentGroup = 23;

  static String value(int type) {
    switch (type) {
      case Acknowledgement: return 'Acknowledgement';
      case NegativeAcknowledgement: return 'Negative Acknowledgement';
      case NoncomplianceNotification: return 'Noncompliance Notification';
      case CancelEmergencyMode: return 'Cancel Emergency Mode';
      case BasicReport: return 'Basic Report';
      case EmergencyBasicReport: return 'Emergency Basic Report';
      case LateralDeviationChangeEvent: return 'Lateral Deviation Change Event';
      case FlightIdentificationGroup: return 'Flight Identification Group';
      case PredictedRouteGroup: return 'Predicted Route Group';
      case EarthReferenceGroup: return 'Earth Reference Group';
      case AirReferenceGroup: return 'Air Reference Group';
      case MeteorologicalGroup: return 'Meteorological Group';
      case AirframeIdentificationGroup: return 'Airframe Identification Group';
      case VerticalRateChangeEvent: return 'Vertical Rate Change Event';
      case AltitudeRangeEvent: return 'Altitude Range Event';
      case WaypointChangeEvent: return 'Waypoint Change Event';
      case IntermediateProjectedIntentGroup: return 'Intermediate Projected Intent Group';
      case FixedProjectedIntentGroup: return 'Fixed Projected Intent Group';
      default:
    }
    return '';
  }
}
