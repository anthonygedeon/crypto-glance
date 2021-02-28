//
//  LineGraphView.swift
//  CryptoGlance
//
//  Created by Anthony Gedeon on 2/24/21.
//

import SwiftUI

struct Line: Shape {

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX / 2, y: rect.maxY / 2))

            path.addLine(to: CGPoint(x: 0, y: rect.maxY / 2))


            path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.maxY / 2))

        }
    }

}

struct LineGraphView: View {
    var body: some View {
        Line()
            .stroke(style: .init(lineWidth: 4, lineCap: .round))
    }
}


struct LineGraphView_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphView()
            .frame(width: 390, height: 200)

    }
}
