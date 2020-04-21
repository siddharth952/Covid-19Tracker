//
//  MainView.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/12/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI
import Lottie
import SwiftUICharts

let starAnimationView = AnimationView(name: "StarAnimation")

struct MainView: View {
    @State var obj:CovidAPI_Response?
    
    @State var noConfirmed: Int = 0
    @State var noActive: Int = 0
    @State var noRecovered: Int = 0
    @State var noDeceased:Int = 0
    @State var show:Bool = true
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                LinearGradient(gradient: gradientBG, startPoint: .leading, endPoint: .topTrailing).edgesIgnoringSafeArea(.all)
                VStack {
                    
                        TopDashboard()
                        
                        VStack{
                            
                            HStack {
                                if show{
                                    CardShimmer(height: 220)
                                    CardShimmer(height: 220)
                                    
                                }else{
                                LineChartView(data: ([8,23,54,32,12,37,7,23,43]), title: "Confirmed", legend: "\(noConfirmed)",style: ChartStyle(backgroundColor: .white, accentColor: .red, gradientColor: GradientColors.prplPink, textColor: .black, legendTextColor: .red, dropShadowColor: .gray)).foregroundColor(.red)
                                
                                //CCard(cardTitle: "Active", data: $noActive)
                              
                                LineChartView(data: ([8,23,54,32,12,37,7,23,43]), title: "Active", legend: "\(noActive)",style: ChartStyle(backgroundColor: .white, accentColor: .blue, gradientColor: GradientColors.blue, textColor: .black, legendTextColor: .blue, dropShadowColor: .gray)).foregroundColor(.blue)
                                
                                }
                            }.padding()
                            
                            HStack {
                                if show{
                                CardShimmer(height: 220)
                                CardShimmer(height: 220)
                                }else{
                                //CCard(cardTitle: "Recovered", data: $noRecovered)
                                LineChartView(data: ([8,23,54,32,12,37,7,23,43]), title: "Recovered", legend: "\(noRecovered)",style: ChartStyle(backgroundColor: .white, accentColor: .green, gradientColor: GradientColors.green, textColor: .black, legendTextColor: .green, dropShadowColor: .gray)).foregroundColor(.green)
                                //CCard(cardTitle: "Deceased", data: $noDeceased)
                                LineChartView(data: ([8,23,54,32,12,37,7,23,43]), title: "Deceased", legend: "\(noDeceased)",style: ChartStyle(backgroundColor: .white, accentColor: .gray, gradientColor: GradientColors.orange, textColor: .black, legendTextColor: .gray, dropShadowColor: .gray)).foregroundColor(.gray)
                                }
                            }.padding()
                        }

                    StateWiseView()
                    if show{
        
                        ForEach(0...10,id: \.self){_ in
        
                            CardShimmer(height: 50)
                        }
                    }else{
                        ForEach((obj?.data.regional)!, id: \.id) { region in
                            StateWiseViewCustom(state: region.loc ?? "Testsccs", c: region.totalConfirmed, a: (region.totalConfirmed - region.discharged), r: region.discharged, d: region.deaths)
                                   }
                  
                    }
                }.onAppear(){
                        self.loadData()
                }
            }
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
                        
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
                            self.show = false
                        }
                        
                        
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
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .fill(Color(.white))
                    .frame(width: UIScreen.main.bounds.width/1.1, height: UIScreen.main.bounds.height/4)
                Image("Group6")
                .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width,
                           maxHeight: UIScreen.main.bounds.height)
                    .shadow(radius: 10)
                
                
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
        .opacity(0.95)
        .shadow(radius: 8)
        .animation(.spring())
    }
    
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
