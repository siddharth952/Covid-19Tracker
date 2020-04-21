//
//  CardShimmer.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/15/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI

struct CardShimmer : View {

@State var show = false
var center = (UIScreen.main.bounds.width / 2) + 110
    var height:CGFloat?
var body : some View{
    
    ZStack{
        
        Color.black.opacity(0.09)
            .frame(height: self.height)
        .cornerRadius(10)
        
        Color.white
        .frame(height: self.height)
        .cornerRadius(10)
        .mask(
        
            Rectangle()
            .fill(
            
                LinearGradient(gradient: .init(colors: [.clear,Color.white.opacity(0.48),.clear]), startPoint: .top, endPoint: .bottom)
            )
            .rotationEffect(.init(degrees: 70))
            .offset(x: self.show ? center : -center)
        
        )
    }
    .padding(.horizontal)
    .padding(.top)
    .onAppear {
        
        withAnimation(Animation.default.speed(0.15).delay(0).repeatForever(autoreverses: false)){
            
            self.show.toggle()
        }
   
        }
    }
    
}
    
struct CardShimmer_Previews: PreviewProvider {
    static var previews: some View {
        CardShimmer()
    }
}
