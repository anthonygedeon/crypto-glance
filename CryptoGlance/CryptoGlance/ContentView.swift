//
//  ContentView.swift
//  CryptoGlance
//
//  Created by Anthony Gedeon on 2/11/21.
//

import SwiftUI
import SwiftUICharts
import Combine

enum Secrets {
    
    public static var apiKey: String {
        get {
            
            guard let filePath = Bundle.main.path(forResource: "Nomics", ofType: "plist") else {
                fatalError("Plist file not available")
            }
            
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("API_KEY is not available")
            }
            
            return value
        }
    }
    
}

class RemoteURLImage : ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                    
            guard let data = data else { return }
        
            DispatchQueue.main.async {
                self.data = data
            }
            
        }.resume()
    }
    
}

struct ImageView: View {
    @ObservedObject var imageLoader : RemoteURLImage
    @State var image : UIImage = UIImage()

    init(withURL url:String) {
        imageLoader = RemoteURLImage(imageURL: url)
    }

    var body: some View {

            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .cornerRadius(50)
                .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

struct CryptoMetaData: Codable, Identifiable, Hashable {
    public let symbol : String?
    public let name : String?
    public let price : String?
    public let logo_url : String?
    
    var id: String? { symbol }
}

struct CryptoCardView: View {
    
    public var symbol : String?
    public var name : String?
    public var price : String?
    public let logo_url : String?
    
    private func clean() -> String? {
        guard let priceUsd = price else { return nil }
        let priceFloat = Float(priceUsd)!
        return String(format: "%.2f", priceFloat)
    }
    
    var body: some View {
        HStack {
            
            Group {
                ZStack {
                    Circle()
                        .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0.0942870006, green: 0.09384272248, blue: 0.1069754437, alpha: 1)))
                    ImageView(withURL: logo_url!)
                    
                }.padding(.trailing, 8)

                VStack(alignment: .leading) {
                    
                    Text("\(name ?? "None")")
                        .font(.custom("Poppins-Bold", size: 18))
                        .foregroundColor(.white)
                    
                    Text("\(symbol ?? "None")")
                        .font(.custom("Poppins-SemiBold", size: 16))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                
                
                VStack(alignment: .trailing, spacing: .zero) {
                    Text("\(clean()!)")
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
                        
                        Text("0.456234")
                            .foregroundColor(.gray)
                            .font(.custom("MontserratAlternates-SemiBold", size: 16))
                    }
                }
            }
        }.padding([.top,.bottom], 6)
        
    }
}

struct ContentView: View {
    
    @State private var result = ""
    @State private var metadata: [CryptoMetaData] = []
    
    private var rows: [GridItem] = [
        GridItem(.flexible(minimum: 335, maximum: 335), spacing: 32),
        GridItem(.flexible(minimum: 335, maximum: 335), spacing: 32),
        GridItem(.flexible(minimum: 335, maximum: 335), spacing: 32)
    ]
    
    func loadData() {
        
        guard let url = URL(string: "https://api.nomics.com/v1/currencies/ticker?key=\(Secrets.apiKey)&per-page=8&page=1") else {
            print("Endpoint is not valid")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode([CryptoMetaData].self, from: data)
                    metadata = decodedData
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
                
                VStack(alignment: .center) {
                    Text("bitvavo")
                        .font(.custom("Comfortaa-Light", fixedSize: 24))
                        .padding([.top, .bottom], 24)
                        .foregroundColor(.white)
                    
                    Text("current price")
                        .foregroundColor(.gray)
                        .font(.custom("Poppins-SemiBold", size: 16))
                    
                    Text("3889.34")
                        .font(.custom("MontserratAlternates-Bold", size: 48))
                        .foregroundColor(.white)
                        .padding(.bottom, -1)
                    
                    ZStack(alignment: .center) {
                        Capsule()
                            .frame(width: 92, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.green)
                        
                        HStack {
                            Image(systemName: "arrow.up.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 8, height: 8)
                                .foregroundColor(.white)
                                
                            
                            Text("0.23%")
                                .foregroundColor(.white)
                                .font(.custom("MontserratAlternates-SemiBold", size: 16))
                        }
                        
                    }
                }
                
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
                    LazyVGrid(columns: rows, alignment: .center) {
                        ForEach(metadata, id: \.self) { cryptoData in
                            CryptoCardView(symbol: cryptoData.symbol,
                                           name: cryptoData.name,
                                           price: cryptoData.price,
                                           logo_url: cryptoData.logo_url)
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
