import 'package:rmp_flutter/widgets/general/entity_card_status.dart';

const entityStatusPresets = {
  "pending": EntityCardStatus.pending(),
  "responded": EntityCardStatus.responded(),
  "resolved": EntityCardStatus.resolved(),
  "received": EntityCardStatus.received(),
  "in-storage": EntityCardStatus.inStorage(),
};