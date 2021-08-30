//
//  RankingViewModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/30.
//

import Foundation
import RxSwift
import RxCocoa

class RankingViewModel {
  
  struct Input {}
  
  struct Output {}
  
  private var _input: RankingViewModel.Input!
  private var _output: RankingViewModel.Output!
  
  private let model = RankingModel()
  private let disposeBag = DisposeBag()
  
  init(trigger: RankingViewModel.Input) {
    _input = trigger
    _output = RankingViewModel.Output.init()
    // model
    
  }
  
  private func bind() {
    
  }
  
  // MARK: -- OUTPUT
  func output() -> RankingViewModel.Output {
    return _output
  }
  
}
