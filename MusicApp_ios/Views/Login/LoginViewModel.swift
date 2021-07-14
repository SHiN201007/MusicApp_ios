//
//  LoginViewModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/07.
//

import Foundation
import RxSwift
import RxCocoa
import KRProgressHUD

struct LoginViewModelInput {
  var doneButton: Observable<Void>
}
protocol LoginViewModelOutput {
  var emailObservable: Observable<String> { get }
  var passwordObservable: Observable<String> { get }
  var showViewObservable: Observable<Bool> { get }
}
protocol LoginViewModelType {
  var outputs: LoginViewModelOutput? { get }
  func setupActions(_ input: LoginViewModelInput)
}

class LoginViewModel: LoginViewModelType {
  var outputs: LoginViewModelOutput?
  
  private var model: AccountSettingModel?
  private let disposeBag = DisposeBag()
  
  private var email: String?
  private var password: String?
  
  private let emailTextSubject = PublishSubject<String>()
  private let passwordTextSubject = PublishSubject<String>()
  private let showViewSubject = PublishSubject<Bool>()
  
  init() {
    self.outputs = self
    model = AccountSettingModel()
    
    // observable
    disposeBag.insert {
      // email
      emailTextSubject.asObservable()
        .subscribe(onNext: { text in
          self.email = text
        })
      
      // password
      passwordTextSubject.asObservable()
        .subscribe(onNext: { text in
          self.password = text
        })
    }
  }
  
  func setupActions(_ input: LoginViewModelInput) {
    input.doneButton
      .subscribe(onNext: {
        self.updateIsShowView(true)
      })
      .disposed(by: disposeBag)
  }
  
  // MARK: INPUT
  // email
  func updateEmailText(_ text: String) {
    self.emailTextSubject.onNext(text)
  }
  // password
  func updatePasswordText(_ text: String) {
    self.passwordTextSubject.onNext(text)
  }
  // showView
  private func updateIsShowView(_ flag: Bool) {
    self.showViewSubject.onNext(flag)
  }
}
// MARK: -- RegisterViewModelOutput
extension LoginViewModel: LoginViewModelOutput {
  var emailObservable: Observable<String> {
    return emailTextSubject.asObservable()
  }
  
  var passwordObservable: Observable<String> {
    return passwordTextSubject.asObservable()
  }
  
  var showViewObservable: Observable<Bool> {
    return showViewSubject.asObservable()
  }
}
