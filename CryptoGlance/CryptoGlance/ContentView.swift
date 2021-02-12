//
//  ContentView.swift
//  CryptoGlance
//
//  Created by Anthony Gedeon on 2/11/21.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        
        VStack(alignment: .center, content: {
            Text("bitvavo")
                .padding(.bottom, 42)
                .font(.largeTitle)
            
            Text("your balance")
                .foregroundColor(.gray)
                .padding(.bottom, 4)
            Text("3889.")
                .font(.custom("big-heading", size: 72, relativeTo: .title))
            
            LineChartView(data: [8,23,54,32,12,37,7,23,43],
                          title: "",
                          form: CGSize(width: 375, height: 100),
                          rateValue: nil,
                          dropShadow: false
                          
            )

                
                

                
        })
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
