//
//  LineGraphView.swift
//  CryptoGlance
//
//  Created by Anthony Gedeon on 2/24/21.
//

import SwiftUI

struct LineGraphView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
        }.fill(Color.green)
    }
}

struct LineGraphView_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphView()
    }
}
