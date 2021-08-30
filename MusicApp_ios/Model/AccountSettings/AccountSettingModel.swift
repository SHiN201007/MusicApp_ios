//
//  AccountSettingModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/07.
//

import Foundation
import Firebase
//import Pring
import Ballcap

let db = Firestore.firestore()

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
  
  // MARK: -- Auth
  func signIn(email: String, password: String, failure:@escaping (String) -> Void, success:@escaping () -> Void){
    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
      if let _error = error {
        print("error", _error)
        failure("ログインできませんでした。")
      }else {
        self.userSetUp(failure: {
          failure("ログインできませんでした。")
        }, succsess: {
          success()
        })
      }
    }
  }
  
  private func userSetUp(failure: @escaping () -> Void, succsess: @escaping () -> Void) {
    if let currentUser = Auth.auth().currentUser?.uid {
      let user: Document<Users.user> = Document(id: currentUser)
      
      let batch = Batch()
      let ref = db.collection("User").document(currentUser)
      
      batch.save(user, reference: ref)
      batch.commit({ error in
        if let _error = error {
          print(_error.localizedDescription)
          failure()
        }
        succsess()
      })
    }
  }
  
  // MARK: -- Account setting
  func updateAccoundData(userName: String, gender: Int, _ failure: @escaping () -> Void, _ succsess: @escaping () -> Void) {
    guard let uid: String = Auth.auth().currentUser?.uid else { return }
    let users: Document<Users.user> = Document(id: uid)
    users.data?.name = userName
    users.data?.gender = gender
    
    let batch = Batch()
    let ref = db.collection("User").document(uid)
    batch.update(users, reference: ref)
    
    batch.commit({ error in
      if let _error = error {
        print(_error.localizedDescription)
        failure()
      }
      succsess()
    })
  }
  
  // upload user icon
  func uploadImage(imageData: Data, _ failure: @escaping (String) -> Void, _ completion: @escaping () -> Void) {
    guard let uid: String = Auth.auth().currentUser?.uid else { return }
    let storage = Storage.storage().reference(forURL: "gs://musicapp-48e7b.appspot.com")
    let imageRef = storage.child("profileImage").child("\(uid).jpeg")
    imageRef.putData(imageData, metadata: nil) { (metaData, error) in
      if error != nil {
        print(error.debugDescription)
        failure("アップロード失敗")
        return
      }
      completion()
    }
  }
  
}
