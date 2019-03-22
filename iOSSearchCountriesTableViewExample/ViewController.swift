//
//  ViewController.swift
//  CountriesTableViewExample
//
//  Created by moxDroid on 2019-03-22.
//  Copyright © 2019 moxDroid. All rights reserved.
// https://www.brunophilipe.com/blog/articles/swift-tutorial-mytodo/

import UIKit

class ViewController: UIViewController {
    
    var searchController: UISearchController!
    var countryNames: [String]?
    var countryCodeAndName :[String:String]?
    var countryCodeAndCapital :[String:String]?
    var countryCodeAndCurrency :[String:String]?
    var allCountryNames: [String]?
    @IBOutlet weak var countryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSearchBar()
        
        self.countryTableView.dataSource = self
        self.countryTableView.delegate = self
        
        setCoutryArray()
    }
    
    private func setupSearchBar()
    {
        //Initialize SearchView
        self.searchController = UISearchController(searchResultsController: nil)
        
        //Add Search Bar to header
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        
        //Set search bar on tableview
        countryTableView.tableHeaderView = searchController.searchBar
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let countries = countryNames else {
            return 0
        }
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryNameCell")!
        cell.textLabel?.text = countryNames?[indexPath.row]
        //cell.textLabel?.textColor = UIColor.green
        cell.detailTextLabel?.text = ""
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(countryNames![indexPath.row])
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
 
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension ViewController{
    func setCoutryArray(){
        countryNames = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"]

        allCountryNames = countryNames
        
        countryCodeAndName = ["BD": "Bangladesh", "BE": "Belgium", "BF": "Burkina Faso", "BG": "Bulgaria", "BA": "Bosnia and Herzegovina", "BB": "Barbados", "WF": "Wallis and Futuna", "BL": "Saint Barthelemy", "BM": "Bermuda", "BN": "Brunei", "BO": "Bolivia", "BH": "Bahrain", "BI": "Burundi", "BJ": "Benin", "BT": "Bhutan", "JM": "Jamaica", "BV": "Bouvet Island", "BW": "Botswana", "WS": "Samoa", "BQ": "Bonaire, Saint Eustatius and Saba ", "BR": "Brazil", "BS": "Bahamas", "JE": "Jersey", "BY": "Belarus", "BZ": "Belize", "RU": "Russia", "RW": "Rwanda", "RS": "Serbia", "TL": "East Timor", "RE": "Reunion", "TM": "Turkmenistan", "TJ": "Tajikistan", "RO": "Romania", "TK": "Tokelau", "GW": "Guinea-Bissau", "GU": "Guam", "GT": "Guatemala", "GS": "South Georgia and the South Sandwich Islands", "GR": "Greece", "GQ": "Equatorial Guinea", "GP": "Guadeloupe", "JP": "Japan", "GY": "Guyana", "GG": "Guernsey", "GF": "French Guiana", "GE": "Georgia", "GD": "Grenada", "GB": "United Kingdom", "GA": "Gabon", "SV": "El Salvador", "GN": "Guinea", "GM": "Gambia", "GL": "Greenland", "GI": "Gibraltar", "GH": "Ghana", "OM": "Oman", "TN": "Tunisia", "JO": "Jordan", "HR": "Croatia", "HT": "Haiti", "HU": "Hungary", "HK": "Hong Kong", "HN": "Honduras", "HM": "Heard Island and McDonald Islands", "VE": "Venezuela", "PR": "Puerto Rico", "PS": "Palestinian Territory", "PW": "Palau", "PT": "Portugal", "SJ": "Svalbard and Jan Mayen", "PY": "Paraguay", "IQ": "Iraq", "PA": "Panama", "PF": "French Polynesia", "PG": "Papua New Guinea", "PE": "Peru", "PK": "Pakistan", "PH": "Philippines", "PN": "Pitcairn", "PL": "Poland", "PM": "Saint Pierre and Miquelon", "ZM": "Zambia", "EH": "Western Sahara", "EE": "Estonia", "EG": "Egypt", "ZA": "South Africa", "EC": "Ecuador", "IT": "Italy", "VN": "Vietnam", "SB": "Solomon Islands", "ET": "Ethiopia", "SO": "Somalia", "ZW": "Zimbabwe", "SA": "Saudi Arabia", "ES": "Spain", "ER": "Eritrea", "ME": "Montenegro", "MD": "Moldova", "MG": "Madagascar", "MF": "Saint Martin", "MA": "Morocco", "MC": "Monaco", "UZ": "Uzbekistan", "MM": "Myanmar", "ML": "Mali", "MO": "Macao", "MN": "Mongolia", "MH": "Marshall Islands", "MK": "Macedonia", "MU": "Mauritius", "MT": "Malta", "MW": "Malawi", "MV": "Maldives", "MQ": "Martinique", "MP": "Northern Mariana Islands", "MS": "Montserrat", "MR": "Mauritania", "IM": "Isle of Man", "UG": "Uganda", "TZ": "Tanzania", "MY": "Malaysia", "MX": "Mexico", "IL": "Israel", "FR": "France", "IO": "British Indian Ocean Territory", "SH": "Saint Helena", "FI": "Finland", "FJ": "Fiji", "FK": "Falkland Islands", "FM": "Micronesia", "FO": "Faroe Islands", "NI": "Nicaragua", "NL": "Netherlands", "NO": "Norway", "NA": "Namibia", "VU": "Vanuatu", "NC": "New Caledonia", "NE": "Niger", "NF": "Norfolk Island", "NG": "Nigeria", "NZ": "New Zealand", "NP": "Nepal", "NR": "Nauru", "NU": "Niue", "CK": "Cook Islands", "XK": "Kosovo", "CI": "Ivory Coast", "CH": "Switzerland", "CO": "Colombia", "CN": "China", "CM": "Cameroon", "CL": "Chile", "CC": "Cocos Islands", "CA": "Canada", "CG": "Republic of the Congo", "CF": "Central African Republic", "CD": "Democratic Republic of the Congo", "CZ": "Czech Republic", "CY": "Cyprus", "CX": "Christmas Island", "CR": "Costa Rica", "CW": "Curacao", "CV": "Cape Verde", "CU": "Cuba", "SZ": "Swaziland", "SY": "Syria", "SX": "Sint Maarten", "KG": "Kyrgyzstan", "KE": "Kenya", "SS": "South Sudan", "SR": "Suriname", "KI": "Kiribati", "KH": "Cambodia", "KN": "Saint Kitts and Nevis", "KM": "Comoros", "ST": "Sao Tome and Principe", "SK": "Slovakia", "KR": "South Korea", "SI": "Slovenia", "KP": "North Korea", "KW": "Kuwait", "SN": "Senegal", "SM": "San Marino", "SL": "Sierra Leone", "SC": "Seychelles", "KZ": "Kazakhstan", "KY": "Cayman Islands", "SG": "Singapore", "SE": "Sweden", "SD": "Sudan", "DO": "Dominican Republic", "DM": "Dominica", "DJ": "Djibouti", "DK": "Denmark", "VG": "British Virgin Islands", "DE": "Germany", "YE": "Yemen", "DZ": "Algeria", "US": "United States", "UY": "Uruguay", "YT": "Mayotte", "UM": "United States Minor Outlying Islands", "LB": "Lebanon", "LC": "Saint Lucia", "LA": "Laos", "TV": "Tuvalu", "TW": "Taiwan", "TT": "Trinidad and Tobago", "TR": "Turkey", "LK": "Sri Lanka", "LI": "Liechtenstein", "LV": "Latvia", "TO": "Tonga", "LT": "Lithuania", "LU": "Luxembourg", "LR": "Liberia", "LS": "Lesotho", "TH": "Thailand", "TF": "French Southern Territories", "TG": "Togo", "TD": "Chad", "TC": "Turks and Caicos Islands", "LY": "Libya", "VA": "Vatican", "VC": "Saint Vincent and the Grenadines", "AE": "United Arab Emirates", "AD": "Andorra", "AG": "Antigua and Barbuda", "AF": "Afghanistan", "AI": "Anguilla", "VI": "U.S. Virgin Islands", "IS": "Iceland", "IR": "Iran", "AM": "Armenia", "AL": "Albania", "AO": "Angola", "AQ": "Antarctica", "AS": "American Samoa", "AR": "Argentina", "AU": "Australia", "AT": "Austria", "AW": "Aruba", "IN": "India", "AX": "Aland Islands", "AZ": "Azerbaijan", "IE": "Ireland", "ID": "Indonesia", "UA": "Ukraine", "QA": "Qatar", "MZ": "Mozambique"]
        
        countryCodeAndCapital = ["BD": "Dhaka", "BE": "Brussels", "BF": "Ouagadougou", "BG": "Sofia", "BA": "Sarajevo", "BB": "Bridgetown", "WF": "Mata Utu", "BL": "Gustavia", "BM": "Hamilton", "BN": "Bandar Seri Begawan", "BO": "Sucre", "BH": "Manama", "BI": "Bujumbura", "BJ": "Porto-Novo", "BT": "Thimphu", "JM": "Kingston", "BV": "", "BW": "Gaborone", "WS": "Apia", "BQ": "", "BR": "Brasilia", "BS": "Nassau", "JE": "Saint Helier", "BY": "Minsk", "BZ": "Belmopan", "RU": "Moscow", "RW": "Kigali", "RS": "Belgrade", "TL": "Dili", "RE": "Saint-Denis", "TM": "Ashgabat", "TJ": "Dushanbe", "RO": "Bucharest", "TK": "", "GW": "Bissau", "GU": "Hagatna", "GT": "Guatemala City", "GS": "Grytviken", "GR": "Athens", "GQ": "Malabo", "GP": "Basse-Terre", "JP": "Tokyo", "GY": "Georgetown", "GG": "St Peter Port", "GF": "Cayenne", "GE": "Tbilisi", "GD": "St. George's", "GB": "London", "GA": "Libreville", "SV": "San Salvador", "GN": "Conakry", "GM": "Banjul", "GL": "Nuuk", "GI": "Gibraltar", "GH": "Accra", "OM": "Muscat", "TN": "Tunis", "JO": "Amman", "HR": "Zagreb", "HT": "Port-au-Prince", "HU": "Budapest", "HK": "Hong Kong", "HN": "Tegucigalpa", "HM": "", "VE": "Caracas", "PR": "San Juan", "PS": "East Jerusalem", "PW": "Melekeok", "PT": "Lisbon", "SJ": "Longyearbyen", "PY": "Asuncion", "IQ": "Baghdad", "PA": "Panama City", "PF": "Papeete", "PG": "Port Moresby", "PE": "Lima", "PK": "Islamabad", "PH": "Manila", "PN": "Adamstown", "PL": "Warsaw", "PM": "Saint-Pierre", "ZM": "Lusaka", "EH": "El-Aaiun", "EE": "Tallinn", "EG": "Cairo", "ZA": "Pretoria", "EC": "Quito", "IT": "Rome", "VN": "Hanoi", "SB": "Honiara", "ET": "Addis Ababa", "SO": "Mogadishu", "ZW": "Harare", "SA": "Riyadh", "ES": "Madrid", "ER": "Asmara", "ME": "Podgorica", "MD": "Chisinau", "MG": "Antananarivo", "MF": "Marigot", "MA": "Rabat", "MC": "Monaco", "UZ": "Tashkent", "MM": "Nay Pyi Taw", "ML": "Bamako", "MO": "Macao", "MN": "Ulan Bator", "MH": "Majuro", "MK": "Skopje", "MU": "Port Louis", "MT": "Valletta", "MW": "Lilongwe", "MV": "Male", "MQ": "Fort-de-France", "MP": "Saipan", "MS": "Plymouth", "MR": "Nouakchott", "IM": "Douglas, Isle of Man", "UG": "Kampala", "TZ": "Dodoma", "MY": "Kuala Lumpur", "MX": "Mexico City", "IL": "Jerusalem", "FR": "Paris", "IO": "Diego Garcia", "SH": "Jamestown", "FI": "Helsinki", "FJ": "Suva", "FK": "Stanley", "FM": "Palikir", "FO": "Torshavn", "NI": "Managua", "NL": "Amsterdam", "NO": "Oslo", "NA": "Windhoek", "VU": "Port Vila", "NC": "Noumea", "NE": "Niamey", "NF": "Kingston", "NG": "Abuja", "NZ": "Wellington", "NP": "Kathmandu", "NR": "Yaren", "NU": "Alofi", "CK": "Avarua", "XK": "Pristina", "CI": "Yamoussoukro", "CH": "Berne", "CO": "Bogota", "CN": "Beijing", "CM": "Yaounde", "CL": "Santiago", "CC": "West Island", "CA": "Ottawa", "CG": "Brazzaville", "CF": "Bangui", "CD": "Kinshasa", "CZ": "Prague", "CY": "Nicosia", "CX": "Flying Fish Cove", "CR": "San Jose", "CW": " Willemstad", "CV": "Praia", "CU": "Havana", "SZ": "Mbabane", "SY": "Damascus", "SX": "Philipsburg", "KG": "Bishkek", "KE": "Nairobi", "SS": "Juba", "SR": "Paramaribo", "KI": "Tarawa", "KH": "Phnom Penh", "KN": "Basseterre", "KM": "Moroni", "ST": "Sao Tome", "SK": "Bratislava", "KR": "Seoul", "SI": "Ljubljana", "KP": "Pyongyang", "KW": "Kuwait City", "SN": "Dakar", "SM": "San Marino", "SL": "Freetown", "SC": "Victoria", "KZ": "Astana", "KY": "George Town", "SG": "Singapur", "SE": "Stockholm", "SD": "Khartoum", "DO": "Santo Domingo", "DM": "Roseau", "DJ": "Djibouti", "DK": "Copenhagen", "VG": "Road Town", "DE": "Berlin", "YE": "Sanaa", "DZ": "Algiers", "US": "Washington", "UY": "Montevideo", "YT": "Mamoudzou", "UM": "", "LB": "Beirut", "LC": "Castries", "LA": "Vientiane", "TV": "Funafuti", "TW": "Taipei", "TT": "Port of Spain", "TR": "Ankara", "LK": "Colombo", "LI": "Vaduz", "LV": "Riga", "TO": "Nuku'alofa", "LT": "Vilnius", "LU": "Luxembourg", "LR": "Monrovia", "LS": "Maseru", "TH": "Bangkok", "TF": "Port-aux-Francais", "TG": "Lome", "TD": "N'Djamena", "TC": "Cockburn Town", "LY": "Tripolis", "VA": "Vatican City", "VC": "Kingstown", "AE": "Abu Dhabi", "AD": "Andorra la Vella", "AG": "St. John's", "AF": "Kabul", "AI": "The Valley", "VI": "Charlotte Amalie", "IS": "Reykjavik", "IR": "Tehran", "AM": "Yerevan", "AL": "Tirana", "AO": "Luanda", "AQ": "", "AS": "Pago Pago", "AR": "Buenos Aires", "AU": "Canberra", "AT": "Vienna", "AW": "Oranjestad", "IN": "New Delhi", "AX": "Mariehamn", "AZ": "Baku", "IE": "Dublin", "ID": "Jakarta", "UA": "Kiev", "QA": "Doha", "MZ": "Maputo"]
        
        countryCodeAndCurrency = ["BD": "BDT", "BE": "EUR", "BF": "XOF", "BG": "BGN", "BA": "BAM", "BB": "BBD", "WF": "XPF", "BL": "EUR", "BM": "BMD", "BN": "BND", "BO": "BOB", "BH": "BHD", "BI": "BIF", "BJ": "XOF", "BT": "BTN", "JM": "JMD", "BV": "NOK", "BW": "BWP", "WS": "WST", "BQ": "USD", "BR": "BRL", "BS": "BSD", "JE": "GBP", "BY": "BYR", "BZ": "BZD", "RU": "RUB", "RW": "RWF", "RS": "RSD", "TL": "USD", "RE": "EUR", "TM": "TMT", "TJ": "TJS", "RO": "RON", "TK": "NZD", "GW": "XOF", "GU": "USD", "GT": "GTQ", "GS": "GBP", "GR": "EUR", "GQ": "XAF", "GP": "EUR", "JP": "JPY", "GY": "GYD", "GG": "GBP", "GF": "EUR", "GE": "GEL", "GD": "XCD", "GB": "GBP", "GA": "XAF", "SV": "USD", "GN": "GNF", "GM": "GMD", "GL": "DKK", "GI": "GIP", "GH": "GHS", "OM": "OMR", "TN": "TND", "JO": "JOD", "HR": "HRK", "HT": "HTG", "HU": "HUF", "HK": "HKD", "HN": "HNL", "HM": "AUD", "VE": "VEF", "PR": "USD", "PS": "ILS", "PW": "USD", "PT": "EUR", "SJ": "NOK", "PY": "PYG", "IQ": "IQD", "PA": "PAB", "PF": "XPF", "PG": "PGK", "PE": "PEN", "PK": "PKR", "PH": "PHP", "PN": "NZD", "PL": "PLN", "PM": "EUR", "ZM": "ZMK", "EH": "MAD", "EE": "EUR", "EG": "EGP", "ZA": "ZAR", "EC": "USD", "IT": "EUR", "VN": "VND", "SB": "SBD", "ET": "ETB", "SO": "SOS", "ZW": "ZWL", "SA": "SAR", "ES": "EUR", "ER": "ERN", "ME": "EUR", "MD": "MDL", "MG": "MGA", "MF": "EUR", "MA": "MAD", "MC": "EUR", "UZ": "UZS", "MM": "MMK", "ML": "XOF", "MO": "MOP", "MN": "MNT", "MH": "USD", "MK": "MKD", "MU": "MUR", "MT": "EUR", "MW": "MWK", "MV": "MVR", "MQ": "EUR", "MP": "USD", "MS": "XCD", "MR": "MRO", "IM": "GBP", "UG": "UGX", "TZ": "TZS", "MY": "MYR", "MX": "MXN", "IL": "ILS", "FR": "EUR", "IO": "USD", "SH": "SHP", "FI": "EUR", "FJ": "FJD", "FK": "FKP", "FM": "USD", "FO": "DKK", "NI": "NIO", "NL": "EUR", "NO": "NOK", "NA": "NAD", "VU": "VUV", "NC": "XPF", "NE": "XOF", "NF": "AUD", "NG": "NGN", "NZ": "NZD", "NP": "NPR", "NR": "AUD", "NU": "NZD", "CK": "NZD", "XK": "EUR", "CI": "XOF", "CH": "CHF", "CO": "COP", "CN": "CNY", "CM": "XAF", "CL": "CLP", "CC": "AUD", "CA": "CAD", "CG": "XAF", "CF": "XAF", "CD": "CDF", "CZ": "CZK", "CY": "EUR", "CX": "AUD", "CR": "CRC", "CW": "ANG", "CV": "CVE", "CU": "CUP", "SZ": "SZL", "SY": "SYP", "SX": "ANG", "KG": "KGS", "KE": "KES", "SS": "SSP", "SR": "SRD", "KI": "AUD", "KH": "KHR", "KN": "XCD", "KM": "KMF", "ST": "STD", "SK": "EUR", "KR": "KRW", "SI": "EUR", "KP": "KPW", "KW": "KWD", "SN": "XOF", "SM": "EUR", "SL": "SLL", "SC": "SCR", "KZ": "KZT", "KY": "KYD", "SG": "SGD", "SE": "SEK", "SD": "SDG", "DO": "DOP", "DM": "XCD", "DJ": "DJF", "DK": "DKK", "VG": "USD", "DE": "EUR", "YE": "YER", "DZ": "DZD", "US": "USD", "UY": "UYU", "YT": "EUR", "UM": "USD", "LB": "LBP", "LC": "XCD", "LA": "LAK", "TV": "AUD", "TW": "TWD", "TT": "TTD", "TR": "TRY", "LK": "LKR", "LI": "CHF", "LV": "EUR", "TO": "TOP", "LT": "LTL", "LU": "EUR", "LR": "LRD", "LS": "LSL", "TH": "THB", "TF": "EUR", "TG": "XOF", "TD": "XAF", "TC": "USD", "LY": "LYD", "VA": "EUR", "VC": "XCD", "AE": "AED", "AD": "EUR", "AG": "XCD", "AF": "AFN", "AI": "XCD", "VI": "USD", "IS": "ISK", "IR": "IRR", "AM": "AMD", "AL": "ALL", "AO": "AOA", "AQ": "", "AS": "USD", "AR": "ARS", "AU": "AUD", "AT": "EUR", "AW": "AWG", "IN": "INR", "AX": "EUR", "AZ": "AZN", "IE": "EUR", "ID": "IDR", "UA": "UAH", "QA": "QAR", "MZ": "MZN"]
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}

extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            countryNames = allCountryNames?.filter { country in
                return country.lowercased().contains(searchText.lowercased())
            }
            
        } else {
            countryNames = allCountryNames
        }
        countryTableView.reloadData()
    }

}



