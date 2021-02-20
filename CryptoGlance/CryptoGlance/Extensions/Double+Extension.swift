//
//  Float+Extension.swift
//  CryptoGlance
//
//  Created by Anthony Gedeon on 2/19/21.
//

import Foundation

public extension Double {        
    
    func truncate(to: String = "%.2f") -> String {
        return String(format: to, self)
    }
    
}
