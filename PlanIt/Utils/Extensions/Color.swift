//
//  Color.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-09-30.
//

import SwiftUI

extension Color {
    static func foreground(_ status: Status) -> Color {
        switch status {
        case .completed: .lightBlue
        case .pending: .lightPurple
        case .canceled: .lightRed
        case .onGoing: .lightGreen
        }
    }

    static func foreground(_ type: TaskType) -> Color {
        switch type {
        case .personal: .lightRed
        case .confidential: .lightPurple
        case .secret: .lightBlue
        }
    }

    static func background(_ status: Status) -> Color {
        switch status {
        case .completed: .taskCompletedBG
        case .pending: .taskPendingBG
        case .canceled: .taskCanceledBG
        case .onGoing: .taskOngoingBG
        }
    }

    var hexString: String {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let rgb: Int = (Int)(red*255)<<16 | (Int)(green*255)<<8 | (Int)(blue*255)
        return String(format: "#%06x", rgb)
    }

    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0

        Scanner(string: cleanHexCode).scanHexInt64(&rgb)

        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }

}
