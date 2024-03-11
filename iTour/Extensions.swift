//
//  Extensions.swift
//  iTour
//
//  Created by Eric de Quartel on 11/03/2024.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}

extension Color {
    func toHex() -> String? {
        // Convert SwiftUI Color to UIColor
        let uiColor = UIColor(self)
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        // Extract RGBA components
        let success = uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        if success {
            // Format as hex string
            let rgb: Int = (Int(red * 255) << 16) | (Int(green * 255) << 8) | Int(blue * 255)
            return String(format:"#%06x", rgb)
        } else {
            // Return nil if unable to extract RGB components
            return nil
        }
    }
}

struct MockData {
    
    static let colors = [
                "e84393",
                "0984e3",
                "6c5ce7",
        "00b894"
    ].map { Color(hex: $0) }
    
    static let iconImageNames = [
                "sun.max.fill",
                "cloud.fill",
                "cloud.rain.fill",
        "cloud.snow.fill"
    ]
}
