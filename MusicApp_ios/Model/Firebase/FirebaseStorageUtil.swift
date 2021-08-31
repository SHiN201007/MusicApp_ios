//
//  FirebaseStorageUtil.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/31.
//

import Foundation

class FirebaseStorageUtil {
  static let shared = FirebaseStorageUtil()
  
  enum Convert: String {
    case product
    
    var value: String {
      switch self {
      case .product:
        return "gs://musicapp-48e7b.appspot.com"
      }
    }
  }
  
  func storage() -> String {
    return FirebaseStorageUtil.Convert.product.value
  }
}
