//
//  ArtistViewModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/30.
//

import Foundation
import RxSwift
import RxCocoa

class ArtistViewModel {
  
  struct Input {}
  
  struct Output {}
  
  private var _input: ArtistViewModel.Input!
  private var _output: ArtistViewModel.Output!
  
  private let model = ArtistModel()
  private let disposeBag = DisposeBag()
  
  init(trigger: ArtistViewModel.Input) {
    _input = trigger
    _output = ArtistViewModel.Output.init()
    // model
    
  }
  
  private func bind() {
    
  }
  
  // MARK: -- OUTPUT
  func output() -> ArtistViewModel.Output {
    return _output
  }
  
}
