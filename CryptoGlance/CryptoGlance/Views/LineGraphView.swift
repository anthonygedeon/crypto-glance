//
//  LineGraphView.swift
//  CryptoGlance
//
//  Created by Anthony Gedeon on 2/24/21.
//

import SwiftUI

struct Line: Shape {
    
    var cryptoPrices: [CGPoint]

    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: CGPoint(x: 0, y: rect.height / 2))

            path.addLine(to: CGPoint(x: 0, y: rect.height / 2))
            
            for index in cryptoPrices {
                path.addLine(to: CGPoint(x: index.x * (rect.size.width / CGFloat(cryptoPrices.count)),
                                         y: rect.size.height / index.y))
            }
            
        }
    }

}

struct LineGraphView: View {
    var body: some View {
        Line(cryptoPrices: [
            .init(x: 1, y: 3),
            .init(x: 2, y: 4),
            .init(x: 3, y: 15),
            .init(x: 4, y: 6),
            .init(x: 5, y: 9),
            .init(x: 6, y: 12),
            .init(x: 7, y: 14),
            .init(x: 8, y: 11),
            .init(x: 9, y: 11),
            .init(x: 10, y: 13),
            .init(x: 11, y: 15),
            .init(x: 12, y: 11),
            .init(x: 13, y: 13),
            .init(x: 14, y: 3),
            .init(x: 15, y: 2),
            .init(x: 16, y: 34),
            
            .init(x: 17, y: 3),
            .init(x: 18, y: 23),
            .init(x: 19, y: 34),
            .init(x: 20, y: 21),
            .init(x: 21, y: 41),
            .init(x: 22, y: 23),
            .init(x: 23, y: 23),
            .init(x: 24, y: 34),
            .init(x: 25, y: 32),
            .init(x: 26, y: 90), // testing
            .init(x: 27, y: 23),
            .init(x: 28, y: 23),
            .init(x: 29, y: 34),
            .init(x: 30, y: 23),
            .init(x: 31, y: 32),
            .init(x: 32, y: 5),
            
            .init(x: 33, y: 19),
            .init(x: 34, y: 6),
            .init(x: 35, y: 45),
            .init(x: 36, y: 3),
            .init(x: 37, y: 19),
            .init(x: 38, y: 32),
            .init(x: 39, y: 4),
            .init(x: 40, y: 32),
            .init(x: 41, y: 11),
            .init(x: 42, y: 13),
            .init(x: 43, y: 14),
            .init(x: 44, y: 0),
            .init(x: 45, y: 1),
            .init(x: 46, y: 7),
            .init(x: 47, y: 9),
            .init(x: 48, y: 1)
        ])
        .stroke(style: .init(lineWidth: 4))
        .fill(Color.green)
    }
}


struct LineGraphView_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphView()
            .frame(maxWidth: .infinity, maxHeight: 200)

    }
}
