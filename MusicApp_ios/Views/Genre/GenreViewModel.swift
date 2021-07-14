//
//  GenreViewModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/14.
//

import Foundation
import RxSwift
import RxCocoa

struct GenreViewModelInput {
  var yesButton: Observable<Void>
  var noButton: Observable<Void>
}
protocol GenreViewModelOutput {
  var showViewObservable: Observable<Bool> { get }
}
protocol GenreViewModelType {
  var outputs: GenreViewModelOutput? { get }
  func setupActions(input: GenreViewModelInput)
}

class GenreViewModel: GenreViewModelType {
  
  var outputs: GenreViewModelOutput?
  private let disposeBag = DisposeBag()
  
  private let showViewSubject = PublishSubject<Bool>()
  
  init() {
    self.outputs = self
  }
  
  func setupActions(input: GenreViewModelInput) {
    // yes
    input.yesButton
      .subscribe(onNext: {
        print("yes")
        self.updateIsShowView(true)
      })
      .disposed(by: disposeBag)
    
    // no
    input.noButton
      .subscribe(onNext: {
        print("no")
        self.updateIsShowView(true)
      })
      .disposed(by: disposeBag)
  }
  
  private func updateIsShowView(_ flag: Bool) {
    self.showViewSubject.onNext(flag)
  }
}
// MARK:-- GenreViewModelOutput
extension GenreViewModel: GenreViewModelOutput {
  var showViewObservable: Observable<Bool> {
    return showViewSubject.asObservable()
  }
}
