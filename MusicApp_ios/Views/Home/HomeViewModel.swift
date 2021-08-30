//
//  HomeViewModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/06/30.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
  
  struct Input {}
  
  struct Output {}
  
  private var _input: HomeViewModel.Input!
  private var _output: HomeViewModel.Output!
  
  private let disposeBag = DisposeBag()
  
  init(trigger: HomeViewModel.Input) {
    _input = trigger
    _output = HomeViewModel.Output.init()
    bind()
  }
  
  private func bind() {
    
  }
  
  // MARK: -- OUTPUT
  func output() -> HomeViewModel.Output {
    return _output
  }
}

