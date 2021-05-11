//
//  TextViewStyle.swift
//  TryingRichString
//
//  Created by Nazmi Yavuz on 21.04.2021.
//

import Foundation
import SwiftRichString


struct TextViewStyle {
    
    
    // The base style is applied to the entire string
    private static let baseStyle = Style {
        $0.font = SystemFonts.Verdana.font(size: 20)
        $0.lineSpacing = 10
        $0.color = UIColor(named: "textColor")
        $0.kerning = Kerning.adobe(-20)
        $0.lineBreakMode = .byWordWrapping
        $0.alignment = .justified
        $0.firstLineHeadIndent = 30
    }
    
    private static  let boldStyle = Style {
        $0.font = SystemFonts.Verdana_Bold.font(size: 20)
        $0.color = UIColor.red
        $0.dynamicText = DynamicText {
            $0.style = .body
            $0.maximumSize = 35.0
            $0.traitCollection = UITraitCollection(userInterfaceIdiom: .pad)
            
        }
    }
    
    private static let italicStyle = Style {
        
        $0.font = SystemFonts.Verdana_Italic.font(size: 20)
        $0.color = UIColor(named: "textColor")
        
    }
    
    private static let underLine = Style {
        $0.underline = (.patternDot, UIColor.red)
        $0.backColor = UIColor.red
    }
    
    // A group container includes all the style defined.
    static let groupStyle = StyleXML.init(base: baseStyle, ["b" : boldStyle, "i": italicStyle, "u": underLine])
    
    
    
    
    
    
}
