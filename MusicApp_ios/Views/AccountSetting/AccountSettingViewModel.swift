//
//  AccountSettingViewModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/14.
//

import Foundation
import RxSwift
import RxCocoa
import KRProgressHUD

struct AccountSettingViewModelInput {
  var doneButton: Observable<Void>
}
protocol AccountSettingViewModelOutput {
  var showViewObservable: Observable<Bool> { get }
}
protocol AccountSettingViewModelType {
  var outputs: AccountSettingViewModelOutput? { get }
  func setupActions(input: AccountSettingViewModelInput)
}

class AccountSettingViewModel: AccountSettingViewModelType {
  var outputs: AccountSettingViewModelOutput?
  
  private let disposeBag = DisposeBag()
  private let model = AccountSettingModel()
  
  private var userName: String?
  private var gender: Int = 0
  private var checkbox: Bool = false
  
  private let userNameSubject = PublishSubject<String>()
  private let genderSubject = PublishSubject<Int>()
  private let checkboxSubject = PublishSubject<Bool>()
  private let imageDataSubject = PublishSubject<Data>()
  private let showViewSubject = PublishSubject<Bool>()
  
  init() {
    self.outputs = self
    
    /// init
    updateGender(0)
    updateCheckbox(false)
    
    // user name
    userNameSubject.asObservable()
      .subscribe(onNext: { text in
        self.userName = text
      })
      .disposed(by: disposeBag)
    
    // gender
    genderSubject.asObservable()
      .subscribe(onNext: { num in
        self.gender = num
      })
      .disposed(by: disposeBag)
    
    // checkbox
    checkboxSubject.asObservable()
      .subscribe(onNext: { flag in
        self.checkbox = flag
      })
      .disposed(by: disposeBag)
    
    // image data
    imageDataSubject.asObservable()
      .subscribe(onNext: { data in
        self.uploadImageData(data: data)
      })
      .disposed(by: disposeBag)
  }
  
  func setupActions(input: AccountSettingViewModelInput) {
    input.doneButton
      .subscribe(onNext: {
        if let userName = self.userName {
          // nil check
          if userName.isEmpty || self.checkbox != true {
            KRProgressHUD.showError(withMessage: "未入力項目があります")
          }else {
            // set user data
            self.model.updateAccoundData(userName: userName, gender: self.gender, { error in
              // error
              KRProgressHUD.showError(withMessage: error)
            }, {
              // succsess
              UserDefaults.standard.setValue(true, forKey: "login")
              self.updateIsShowView(true)
            })
          }
        }
      })
      .disposed(by: disposeBag)
  }
  
  private func uploadImageData(data: Data) {
    KRProgressHUD.show()
    self.model.uploadImage(imageData: data, { error in
      KRProgressHUD.showError(withMessage: error)
    }, {
      KRProgressHUD.dismiss()
    })
  }
  
  // INPUT
  /// user name
  func updateUserName(_ text: String) {
    userNameSubject.onNext(text)
  }
  /// gender
  func updateGender(_ num: Int) {
    genderSubject.onNext(num)
  }
  /// checkbox
  func updateCheckbox(_ flag: Bool) {
    checkboxSubject.onNext(flag)
  }
  /// image data
  func updateImage(_ data: Data) {
    imageDataSubject.onNext(data)
  }
  /// show view
  private func updateIsShowView(_ flag: Bool) {
    showViewSubject.onNext(flag)
  }
}

extension AccountSettingViewModel: AccountSettingViewModelOutput {
  var showViewObservable: Observable<Bool> {
    return showViewSubject.asObservable()
  }
}
