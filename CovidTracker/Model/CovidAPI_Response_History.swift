//
//  CovidAPI_Response_History.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/21/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import Foundation

class CovidAPI_Response_History: Codable{
    var success:Bool
    var data:[Data_History]
    var lastRefreshed:String
    var lastOriginUpdate:String
}

class Data_History:Codable{
    var day:String
    var summary:Summary
}




//class Summary:Codable{
//    var total:Int
//    var confirmedCasesIndian:Int
//    var confirmedCasesForeign:Int
//    var discharged:Int
//    var deaths:Int
//    var confirmedButLocationUnidentified:Int
//}
//
