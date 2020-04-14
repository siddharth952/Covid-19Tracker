//
//  StateWiseView.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/13/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI


struct StateWiseView: View {
   var state:String = "State/UT"

    var body: some View {
        HStack{
            Text(state).fontWeight(.bold).overlay(Rectangle().frame(width:130,height:50)
                .foregroundColor(.gray).opacity(0.2)).padding(50)
            Text("C").fontWeight(.bold).foregroundColor(.red).overlay(Rectangle().frame(width:50,height:50)
            .foregroundColor(.gray).opacity(0.2)).padding()
            Text("A").fontWeight(.bold).foregroundColor(.blue).overlay(Rectangle().frame(width:50,height:50)
            .foregroundColor(.gray).opacity(0.2)).padding()
            Text("R").fontWeight(.bold).overlay(Rectangle().frame(width:50,height:50)
            .foregroundColor(.gray).foregroundColor(.green).opacity(0.2)).padding()
            Text("D").fontWeight(.bold).foregroundColor(.gray).overlay(Rectangle().frame(width:50,height:50)
            .foregroundColor(.gray).opacity(0.2)).padding()
            
            
        }
    }
}


struct StateWiseViewCustom: View {
     var state:String
     var c:Int
     var a:Int
   var r:Int
     var d:Int
    var body: some View {
        HStack{
            Text(state).overlay(Rectangle().frame(width:130,height:50)
                .foregroundColor(.gray).opacity(0.2)).padding(50)
            Text("\(c)").fontWeight(.bold).foregroundColor(.red).overlay(Rectangle().frame(width:50,height:50)
            .foregroundColor(.gray).opacity(0.2)).padding()
            Text("\(a)").fontWeight(.bold).foregroundColor(.blue).overlay(Rectangle().frame(width:50,height:50)
            .foregroundColor(.gray).opacity(0.2)).padding()
            Text("\(r)").fontWeight(.bold).overlay(Rectangle().frame(width:50,height:50)
            .foregroundColor(.gray).foregroundColor(.green).opacity(0.2)).padding()
            Text("\(d)").fontWeight(.bold).foregroundColor(.gray).overlay(Rectangle().frame(width:50,height:50)
            .foregroundColor(.gray).opacity(0.2)).padding()
            
            
        }
    }
}

struct StateWiseView_Previews: PreviewProvider {
    static var previews: some View {
        StateWiseView()
    }
}
