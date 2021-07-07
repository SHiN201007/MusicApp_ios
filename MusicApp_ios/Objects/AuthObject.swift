//
//  AuthObject.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/07.
//

import Foundation

class AuthObject: NSObject {
  static let shared = AuthObject()
  
  var email: String?
  var password: String?
}
