//
//  AccountSettingViewModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/14.
//

import Foundation
import RxSwift
import RxCocoa

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
  
  private let showViewSubject = PublishSubject<Bool>()
  
  init() {
    self.outputs = self
  }
  
  func setupActions(input: AccountSettingViewModelInput) {
    input.doneButton
      .subscribe(onNext: {
        self.updateIsShowView(true)
      })
      .disposed(by: disposeBag)
  }
  
  // INPUT
  private func updateIsShowView(_ flag: Bool) {
    showViewSubject.onNext(flag)
  }
}

extension AccountSettingViewModel: AccountSettingViewModelOutput {
  var showViewObservable: Observable<Bool> {
    return showViewSubject.asObservable()
  }
}
