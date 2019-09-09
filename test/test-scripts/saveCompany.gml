///saveCompany()
// Saves company to disk

var companyString = json_encode(object_station.company);
writeFile(companyString, "company");
loadCompany();
