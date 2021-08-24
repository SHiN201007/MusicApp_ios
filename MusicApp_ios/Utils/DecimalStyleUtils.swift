//
//  DecimalStyleUtils.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/24.
//

import Foundation

class DecimalStyleUtils {
  static let shared = DecimalStyleUtils()
  
  func configure(value: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = ","
    formatter.groupingSize = 3
    
    return formatter.string(from: NSNumber(value: value)) ?? ""
  }
}
