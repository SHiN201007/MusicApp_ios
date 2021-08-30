//
//  ArtistDetailViewModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/30.
//

import Foundation
import RxSwift
import RxCocoa

class ArtistDetailViewModel {
  
  struct Input {}
  
  struct Output {}
  
  private var _input: ArtistDetailViewModel.Input!
  private var _output: ArtistDetailViewModel.Output!
  
  private let disposeBag = DisposeBag()
  
  init(trigger: ArtistDetailViewModel.Input) {
    _input = trigger
    _output = ArtistDetailViewModel.Output.init()
    bind()
  }
  
  private func bind() {
    
  }
  
  // MARK: -- OUTPUT
  func output() -> ArtistDetailViewModel.Output {
    return _output
  }
  
}
