//
//  UIColorExtension.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/06/28.
//

import Foundation
import UIKit

extension UIColor {
  class func rgba(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
      return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
  }
  
  convenience init(code: String) {
    var color: UInt64 = 0
    var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0
    if Scanner(string: code.replacingOccurrences(of: "#", with: "")).scanHexInt64(&color) {
      r = CGFloat((color & 0xFF0000) >> 16) / 255.0
      g = CGFloat((color & 0x00FF00) >>  8) / 255.0
      b = CGFloat( color & 0x0000FF       ) / 255.0
    }
    self.init(red: r, green: g, blue: b, alpha: 1.0)
  }
  
  // MARK: -- Add Colors --
  class func mainColor() -> UIColor {
    return UIColor(code: "#3E3F68")
  }
  
  class func backgroundColor() -> UIColor {
    return UIColor(code: "#F5F5F5")
  }
  
  class func textColor() -> UIColor {
    return UIColor(code: "#222455")
  }

  class func placeHolderColor() -> UIColor {
    return UIColor(code: "#8A98BA")
  }

}
