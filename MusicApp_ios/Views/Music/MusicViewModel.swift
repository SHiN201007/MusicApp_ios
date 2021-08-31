//
//  MusicViewModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/31.
//

import Foundation
import RxSwift
import RxCocoa

class MusicViewModel {
  
  struct Input {
    
  }
  
  struct Output {
    
  }
  
  private var _input: MusicViewModel.Input!
  private var _output: MusicViewModel.Output!
  
  private let model = HistoryModel()
  private let disposeBag = DisposeBag()
  
  init(trigger: MusicViewModel.Input) {
    _input = trigger
    _output = MusicViewModel.Output.init()
    
    model.insertHistoryData()
  }
  
  // MARK: -- OUTPUT
  func output() -> MusicViewModel.Output {
    return _output
  }
  
}
