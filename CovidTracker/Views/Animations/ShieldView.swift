//
//  ShieldView.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/12/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI

struct ShieldView: View {
    
    let gradient = Gradient(colors: [Color("Color1"), Color("Color2")])

    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 180, style: .continuous)
                           .fill(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .topTrailing))
                           .frame(width: 450, height: 500)
                    
                VStack {
                    LottieView(fileName: "shield_ani1").frame(width:500,height:500).offset(x:-20,y:20)
                }
               
            }
           
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ShieldView_Previews: PreviewProvider {
    static var previews: some View {
        ShieldView()
    }
}
