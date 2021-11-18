const baseApiUrl = "https://rmp.ryuhub.dev/api";

// auth
const baseAuthUrl = "$baseApiUrl/auth/mobile";

// user
const baseUserUrl = "$baseApiUrl/users";

const basePackageUrl = "$baseApiUrl/packages";

const getPackagesUrl = basePackageUrl;
const getCreatePackageUrl = basePackageUrl;
const getPackagesMasterDataUrl = "$basePackageUrl/master-data";
const getPackagesByResidentUrl = "$basePackageUrl/residents";
String getPackageByIdUrl(String id) => "$basePackageUrl/$id";
String getEditPackageUrl(String id) => "$basePackageUrl/$id/update";
String getDeletePackageUrl(String id) => "$basePackageUrl/$id/delete";
String getConfirmDeliveryUrl(String id) => "$basePackageUrl/$id/confirm";

const baseRoomsUrl = "$baseApiUrl/rooms";
const getRoomIdListUrl = "$baseRoomsUrl/id-list";
// report
const baseReportUrl = "$baseApiUrl/reports";
const getReportsUrl = baseReportUrl;
const getReportsResidentUrl = "$baseReportUrl/resident";
const createReportUrl = baseReportUrl;
String getReportUrl(String id) => "$baseReportUrl/$id";
String replyReportUrl(String id) => "$baseReportUrl/$id/reply";
String resolveReportUrl(String id) => "$baseReportUrl/$id/resolve";

//payment
const basePaymentUrl = "$baseApiUrl/payments";
const getPaymentsUrl = "$basePaymentUrl/residents";
const getCommonChargeUrl = "$basePaymentUrl/common-charge";

String paySpecificPaymentUrl(String id) => "$basePaymentUrl/$id";
