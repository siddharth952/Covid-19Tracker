//
//  IntroView.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/12/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI

struct IntroView: View {
    @State var activateLink:Bool = false
    var body: some View {
        
        NavigationView {
            NavigationLink(destination: MainView(),isActive: $activateLink) {
                VStack{
                    ShieldView().offset(y: -120)
                    Spacer()
                    Button(action: {
                        self.activateLink.toggle()
                    
                    }){
                        Text("Get Started")
                    }

                }
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
