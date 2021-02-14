//
//  ContentView.swift
//  CryptoGlance
//
//  Created by Anthony Gedeon on 2/11/21.
//

import SwiftUI
import SwiftUICharts
import Foundation

struct CryptoMetaData: Codable {
    public var title: String
    //    public var asset_id: String
//    public var name: String
//    public var price_usd: Float
//    public var type_is_crypto: Int
}

struct APIData: Codable {
    public var cryptocurrencies: [CryptoMetaData]
}

struct APIResponse: Codable {
    public var data: APIData
}

struct CryptoCardView: View {
    
    var body: some View {
        HStack {
            
            ZStack {
                Circle()
                    .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(#colorLiteral(red: 0.0942870006, green: 0.09384272248, blue: 0.1069754437, alpha: 1)))
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
            }.padding(.trailing, 8)

            VStack(alignment: .leading) {
                
                Text("Ripple")
                    .font(.custom("Poppins-Bold", size: 18))
                    .foregroundColor(.white)
                
                Text("XRP")
                    .font(.custom("Poppins-SemiBold", size: 16))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: .zero) {
                Text("1899.12")
                    .font(.custom("MontserratAlternates-Bold", size: 18))
                    .foregroundColor(.white)
            
                
                HStack {
                    Image(systemName: "arrow.up.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 8, height: 8)
                        .foregroundColor(.green)
                        
                    
                    Text("0.23%")
                        .foregroundColor(.green)
                        .padding(.trailing, 24)
                        .font(.custom("MontserratAlternates-SemiBold", size: 16))
                    
                    Text("0.563831")
                        .foregroundColor(.gray)
                        .font(.custom("MontserratAlternates-SemiBold", size: 16))
                }
            }
                
        }.padding([.top,.bottom], 6)
        
    }
}

struct ContentView: View {
    
    @State private var result = ""
    
    func loadData() {
        
        guard let url = URL(string: "https://www.poemist.com/api/v1/randompoems") else {
            print("Endpoint is not valid")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(APIResponse.self, from: data)
                    print(decodedData)
                } catch {
                    print ("Error! Something went wrong, yikes")
                }
            }
            
        }.resume()
        
    }
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .center, content: {
                Text("bitvavo")
                    .font(.custom("Comfortaa-Light", fixedSize: 24))
                    .padding(.bottom, 24)
                    .foregroundColor(.white)
                
                Text("your balance")
                    .foregroundColor(.gray)
                    .font(.custom("Poppins-SemiBold", size: 16))
                
                Text("3889.34")
                    .font(.custom("MontserratAlternates-Bold", size: 48))
                    .foregroundColor(.white)
                
                
                LineView(data: [8,23,54,32,12,37,7,23,43],
                         style: ChartStyle(backgroundColor: .black,
                                    accentColor: .white,
                                     gradientColor: GradientColor(start: .green, end: .green),
                                     textColor: .black,
                                     legendTextColor: .clear,
                                     dropShadowColor: .clear)
                )
                
                
                
                HStack(alignment: .center, spacing: .none, content: {
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
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(lineWidth: 2)
                )
                .background(Color(#colorLiteral(red: 0.0942870006, green: 0.09384272248, blue: 0.1069754437, alpha: 1)), alignment: .center)
                .padding(.horizontal, 24)
                .padding(.bottom, 12)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 48) {
                        ForEach(0..<10) { _ in
                            VStack {
                                CryptoCardView()
                                CryptoCardView()
                                CryptoCardView()
                            }.frame(width: 335)
                        }
                        
                    }.padding(.horizontal, 24)
                                        
                }

                
            })
            
            
        }.onAppear(perform: loadData)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
