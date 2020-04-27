//
//  IntroView.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/12/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct IntroView: View {
    @State var activateLink:Bool = false
    let gradient = Gradient(colors: [Color("Color1"), Color("Color2")])

    var body: some View {
        
        HStack {
            NavigationView {
                NavigationLink(destination: ContentView(),isActive: $activateLink) {
                    VStack{
                        ShieldView().offset(y: -120)
                        Text("Stay Home \n\t\t\tSave The World").font(.largeTitle).foregroundColor(.black)
                        Spacer()
                        
                        
                        Button(action: {
                            self.activateLink.toggle()
                        
                        }){
                            ZStack{
                                RoundedRectangle(cornerRadius: 60, style: .continuous)
                                    .fill(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .topTrailing))
                                    .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/8 - 50, alignment: .center).shadow(radius: 6)
                                Text("Get Started").foregroundColor(.black).fontWeight(.bold)
                            }
                            
                        }

                    }
                }.navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
