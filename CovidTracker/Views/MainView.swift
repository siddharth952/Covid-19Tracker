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
    @State var obj:CovidAPI_Response?
    
    @State var noConfirmed: Int = 0
    @State var noActive: Int = 0
    @State var noRecovered: Int = 0
    @State var noDeceased:Int = 0
    var body: some View {
        
        VStack {
            ZStack {
                TopDashboard().edgesIgnoringSafeArea(.top)
                
                VStack{
                    HStack {
                        CCard(cardTitle: "Confirmed", data: $noConfirmed)
                        CCard(cardTitle: "Active", data: $noActive)
                    }.padding()
                    
                    HStack {
                        CCard(cardTitle: "Recovered", data: $noRecovered)
                        CCard(cardTitle: "Deceased", data: $noDeceased)
                    }.padding()
                }.offset(y:220)
                

            }.onAppear(){
                self.loadData()
            }
            Spacer()
            StateWiseView()
            
            StateWiseViewCustom(state: (obj?.data.regional)?.description ?? "", c: 2, a: 2, r: 2, d: 2)
        }
        
    }
    
    func loadData(){
        
        let urlBase = "https://api.rootnet.in/covid19-in/stats/latest"
        
    
                
            if let url = URL(string: urlBase) {
            
               URLSession.shared.dataTask(with: url) { data, response, error in
                  if let data = data {
                    
                    do{
                        let res = try JSONDecoder().decode(CovidAPI_Response.self, from: data)
                        print(res.data.summary.total)
                        self.noConfirmed = res.data.summary.total
                        self.noActive = ((res.data.summary.total) - (res.data.summary.discharged))
                        self.noRecovered = res.data.summary.discharged
                        self.noDeceased = res.data.summary.deaths
                        
                        self.obj = res
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

struct TopDashboard:View{
    let gradient = Gradient(colors: [Color("Color1"), Color("Color2")])
    
    
    
    var body:some View{
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .topTrailing))
                    .frame(width: 450, height: 250)
                Image("Group6")
                
                VStack {
                    LottieView(fileName: "prueba-doctores-freepik").frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height/5).offset(y:40)
                }
                
            }
            
        }
    }
}


struct CCard:View {
    let cardTitle:String
    @Binding var data:Int
    var body: some View{
        
        VStack() {
            
            HStack(alignment: .top) {
                Text(cardTitle)
                    .foregroundColor(.black)
                    .fontWeight(.light)
                    .font(.largeTitle)
                    .opacity(0.9)
            }
            Text("\(data)")
        }
        .padding(.top, -15)
        .frame(width:180, height:150)
        .background(Color(.white))
        .cornerRadius(25)
        .opacity(0.90)
        .shadow(radius: 8)
        .animation(.spring())
    }
    
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
