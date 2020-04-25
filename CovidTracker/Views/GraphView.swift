//
//  GraphView.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/21/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI
import SwiftUICharts

 var noConfirmed_HistoryG:[Int] = []
var noActive_HistoryG:[Int] = []
 var noRecovered_HistoryG:[Int] = []
var noDeceased_HistoryG:[Int] = []
 var historyCounterG:Int = 0


struct GraphView: View {
    var body: some View {
        VStack{
             LineView(data: [Double(noConfirmed_HistoryG[historyCounterG - 18]),Double(noConfirmed_HistoryG[historyCounterG - 16]),Double(noConfirmed_HistoryG[historyCounterG - 14]),Double(noConfirmed_HistoryG[historyCounterG - 12]),Double(noConfirmed_HistoryG[historyCounterG - 10]),Double(noConfirmed_HistoryG[historyCounterG - 8]),Double(noConfirmed_HistoryG[historyCounterG - 6]),Double(noConfirmed_HistoryG[historyCounterG - 4]),Double(noConfirmed_HistoryG[historyCounterG - 1])], title: "Confirmed", legend: "Full screen")
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
