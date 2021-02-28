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
            
            path.move(to: CGPoint(x: 0, y: rect.height))

            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            for index in cryptoPrices {
                path.addLine(to: CGPoint(x: index.x * 100,
                                         y: rect.size.height / index.y))
            }
            
        }
    }

}

struct LineGraphView: View {
    var body: some View {
        Line(cryptoPrices: [
            .init(x: 1, y: 5),
            .init(x: 2, y: 4),
            .init(x: 3, y: 15),
            .init(x: 4, y: 6),
            .init(x: 5, y: 9),
            .init(x: 6, y: 12),
            .init(x: 7, y: 14),
            .init(x: 8, y: 11)
        ])
        .stroke(style: .init(lineWidth: 3))
        .fill(Color.green)
    }
}


struct LineGraphView_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphView()
            .frame(maxWidth: .infinity, maxHeight: 200)

    }
}
