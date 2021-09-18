const baseApiUrl = "https://rmp.ryuhub.dev/api";
// const baseApiUrl = "http://localhost:1234/api";

// auth
const baseAuthUrl = "$baseApiUrl/auth/mobile";

// user
const baseUserUrl = "$baseApiUrl/users";

// report
const baseReportUrl = "$baseApiUrl/reports";
const getReportsUrl = baseReportUrl;
const createReportUrl = baseReportUrl;
String getReportUrl(String id) => "$baseReportUrl/$id";
String replyReportUrl(String id) => "$baseReportUrl/$id/reply";
String resolveReportUrl(String id) => "$baseReportUrl/$id/resolve";
