import 'message.dart';

// Representation of a PlanePlotter Message
// Format : mode reg ack label block_id msg_num flight_id text
// Example: AC2 .N901WN ! H1 7 D24A WN9003 ++76502,901,B737-700,200213,WN9003,KSMF,KLAS,0441,SW1905  6  N3841.9,W12119.7,132101,10330,000.3,159,004,CL,00000,0,  N3841.4,W12117.6,132101,10760,-00.8,213,003,CL,00000,0,  N3840.9,W12115.3,132102,11351,-
class PlanePlotterMessage extends Message {
  String mode;                  // Mode (i.e. 2)
  String tail;                  // Tail / Registration
  String ack;                   // ACK (i.e. M, !)
  String label;                 // Label (i.e. H1)
  String blockId;               // Block ID (i.e. 7)
  String messageNumber;         // Message Number (i.e. D24A)
  String flightNumber;          // Flight Number
  String text;                  // Text

  PlanePlotterMessage(
    source,
    this.mode,
    this.tail,
    this.ack,
    this.label,
    this.blockId,
    this.messageNumber,
    this.flightNumber,
    this.text
  ) : super(source) {}
}
