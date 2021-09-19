const baseApiUrl = "https://rmp.ryuhub.dev/api";
// const baseApiUrl = "http://localhost:1234/api";

const baseAuthUrl = "$baseApiUrl/auth/mobile";

const baseUserUrl = "$baseApiUrl/users";

const basePackageUrl = "$baseApiUrl/packages";

const getPackagesUrl = basePackageUrl;
const getCreatePackageUrl = basePackageUrl;
const getPackageMasterDataUrl = "$basePackageUrl/master-data";
const getPackageByResidentUrl = "$basePackageUrl/resident";
String getPackageByIdUrl(String id) => "$basePackageUrl/$id";
String getEditPackageUrl(String id) => "$basePackageUrl/$id/update";
String getDeletePackageUrl(String id) => "$basePackageUrl/$id/delete";
String getConfirmDeliveryUrl(String id) => "$basePackageUrl/$id/confirm";

const baseRoomsUrl = "$baseApiUrl/rooms";
const getRoomIdListUrl = "$baseRoomsUrl/id-list";
