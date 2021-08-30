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
  
  private let model = ArtistMusicModel()
  private let disposeBag = DisposeBag()
  
  init(trigger: ArtistDetailViewModel.Input) {
    _input = trigger
    _output = ArtistDetailViewModel.Output.init()
    // model
    bind()
  }
  
  private func bind() {
    model.getArtistMusicList { items in
      print("ITEM:", items)
    }
  }
  
  // MARK: -- OUTPUT
  func output() -> ArtistDetailViewModel.Output {
    return _output
  }
  
}
