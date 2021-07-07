//
//  AccountSettingModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/07.
//

import Foundation
import Firebase

class AccountSettingModel {
  // MARK: -- Regiser
  func signUp(email: String, password: String, failure:@escaping (String) -> Void, success:@escaping () -> Void){
    // auth signUp
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
      if let _error = error {
        print("error", _error)
        failure("このアドレスは既に登録されているか\nまたは、通信エラーが起きました。")
      }else {
//        if let result = result {
//          // send email
//          result.user.sendEmailVerification(completion: { error in
//            if let _error = error {
//              print("error", _error)
//              failure("認証メールの送信に失敗しました。\nもう一度送信してください。")
//            }else {
//              success()
//            }
//          })
//        }
        success()
      }
    }
  }
  
  
}
