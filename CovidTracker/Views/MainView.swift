//
//  MainView.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/12/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI
import Lottie

let starAnimationView = AnimationView(name: "StarAnimation")

struct MainView: View {
    
    
    @State var noConfirmed: Int = 0
    @State var noActive: Int = 0
    @State var noRecovered: Int = 0
    @State var noDeceased:Int = 0
    var body: some View {
        
        VStack {
            Text("\(noConfirmed)")
            Text("\(noActive)")
            Text("\(noRecovered)")
            Text("\(noDeceased)")
        }.onAppear(){
            self.loadData()
        }
        
    }
    
    func loadData(){
        
        var urlBase = "https://api.rootnet.in/covid19-in/stats/latest"
        var result:CovidAPI_Response?
    
                
            if let url = URL(string: urlBase) {
            
               URLSession.shared.dataTask(with: url) { data, response, error in
                  if let data = data {
                    
                    do{
                        var res = try JSONDecoder().decode(CovidAPI_Response.self, from: data)
                        print(res.data.summary.total)
                        self.noConfirmed = res.data.summary.total
                        self.noActive = ((res.data.summary.total) - (res.data.summary.discharged))
                        self.noRecovered = res.data.summary.discharged
                        self.noDeceased = res.data.summary.deaths
                    }catch let error{
                        print("Error while parsing JSON: \(error)")
                    }
                   }
               }.resume()
            }
              //let task = URLSession.shared.dataTask(with: url, completionHandler: parseStateItemsFromData(data:response))
              //task.resume()
       
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
