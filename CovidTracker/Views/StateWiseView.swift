//
//  StateWiseView.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/13/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI


struct StateWiseView: View {
   var state:String = "Region"

    var body: some View {
        HStack{
            Text(state).fontWeight(.bold).overlay(Rectangle().frame(width:140,height:40)
                .foregroundColor(.gray).opacity(0.2).cornerRadius(10)).padding(40)
            Text("C").fontWeight(.bold).foregroundColor(.red).overlay(Rectangle().frame(width:40,height:40)
            .foregroundColor(.gray).opacity(0.2).cornerRadius(10)).padding(20)
            Text("A").fontWeight(.bold).foregroundColor(.blue).overlay(Rectangle().frame(width:40,height:40)
            .foregroundColor(.gray).opacity(0.2).cornerRadius(10)).padding(20)
            Text("R").fontWeight(.bold).overlay(Rectangle().frame(width:40,height:40)
            .foregroundColor(.gray).foregroundColor(.green).opacity(0.2).cornerRadius(10)).padding(20)
            Text("D").fontWeight(.bold).foregroundColor(.gray).overlay(Rectangle().frame(width:40,height:40)
            .foregroundColor(.gray).opacity(0.2).cornerRadius(10)).padding(20)
            
            
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
            Text(state).multilineTextAlignment(.leading).overlay(Rectangle().frame(width:130,height:50)
                .foregroundColor(.gray).opacity(0.2).cornerRadius(10)).padding(.leading,40).padding(.trailing,40)
            Text("\(c)").foregroundColor(.red).overlay(Rectangle().frame(width:40,height:40)
                .foregroundColor(.gray).opacity(0.2).cornerRadius(10)).padding(.leading,20).padding(.trailing,20)
            Text("\(a)").foregroundColor(.blue).overlay(Rectangle().frame(width:40,height:40)
                .foregroundColor(.gray).opacity(0.2).cornerRadius(10)).padding(.leading,20).padding(.trailing,20)
            Text("\(r)").overlay(Rectangle().frame(width:40,height:40)
                .foregroundColor(.gray).foregroundColor(.green).opacity(0.2).cornerRadius(10)).padding(20)
            Text("\(d)").foregroundColor(.gray).overlay(Rectangle().frame(width:40,height:40)
                .foregroundColor(.gray).opacity(0.2).cornerRadius(10)).padding(.leading,20).padding(.trailing,20)
            
            
        }
    }
}

struct StateWiseView_Previews: PreviewProvider {
    static var previews: some View {
        StateWiseView()
    }
}
