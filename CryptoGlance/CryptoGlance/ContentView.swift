//
//  ContentView.swift
//  CryptoGlance
//
//  Created by Anthony Gedeon on 2/11/21.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    let chartStyle = ChartStyle(backgroundColor: .clear,
                                accentColor: .orange,
                                gradientColor: GradientColor(start: .green,
                                                             end: .orange),
                                textColor: .white,
                                legendTextColor: .white,
                                dropShadowColor: .white)
    
    
    @State private var result = ""
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .center, content: {
                Text("bitvavo")
                    .padding(.bottom, 42)
                    .font(.custom("logo", fixedSize: 24))
                    .foregroundColor(.white)
                Text("your balance")
                    .foregroundColor(.gray)
                    .padding(.bottom, 4)
                Text("3889.")
                    .font(.custom("big-heading", size: 72, relativeTo: .title))
                    .foregroundColor(.white)
                
                LineChartView(data: [8,23,54,32,12,37,7,23,43],
                              title: "",
                              style: chartStyle,
                              form: ChartForm.extraLarge,
                              rateValue: nil,
                              dropShadow: false
                )

                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: .none, content: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(#colorLiteral(red: 0.1536664665, green: 0.1726024449, blue: 0.1984877288, alpha: 1)))
                    ZStack(alignment: .leading) {
                        if result.isEmpty {
                            Text("Search")
                                .foregroundColor(Color(#colorLiteral(red: 0.2018727362, green: 0.2356998324, blue: 0.2657114863, alpha: 1)))
                                .bold()
                        }
                        TextField("", text: $result)
                            .foregroundColor(.white)
                            .font(Font.custom("", size: 18))
                    }

                })
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
                .background(Color(#colorLiteral(red: 0.0942870006, green: 0.09384272248, blue: 0.1069754437, alpha: 1)), alignment: .center)
                    
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
