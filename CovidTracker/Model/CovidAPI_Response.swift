//
//  CovidStats.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/13/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import Foundation



//    func parseStateItemsFromData(data:Data) -> [StateItem]{
//        var response : CovidAPI_Response
//        do{
//            response =  try JSONDecoder().decode(CovidAPI_Response.self, from: data)
//        } catch{
//            print("Error while parsing JSON: \(error)")
//            return []
//        }
//
//        if response.success != true{
//            print("Status is not true : \(response.success)")
//           return []
//        }
//        return response.data.regional ?? []
//    }




class CovidAPI_Response: Codable{
    var success:Bool
    var data:API_Data
    var lastRefreshed:String
    var lastOriginUpdate:String
}

class API_Data:Codable{
    var summary:Summary
    var regional:[StateItem]
}

class Summary:Codable{
    var total:Int
    var confirmedCasesIndian:Int
    var confirmedCasesForeign:Int
    var discharged:Int
    var deaths:Int
    var confirmedButLocationUnidentified:Int
    
}

class StateItem:Codable{
    var id = UUID()
    
    var loc:String
    var confirmedCasesIndian:Int
    var discharged:Int
    var deaths:Int
    var confirmedCasesForeign:Int
    var totalConfirmed:Int
    
    //for UUID and conform to protocol of codingkeys
    enum CodingKeys:String, CodingKey {
           case loc = "loc"
           case confirmedCasesIndian = "confirmedCasesIndian"
           case discharged = "discharged"
           case deaths = "deaths"
           case confirmedCasesForeign = "confirmedCasesForeign"
           case totalConfirmed = "totalConfirmed"
    }
    
    
}
