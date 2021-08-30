//
//  ReccomendViewModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/24.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

//
//protocol RecommendViewModelOutput {
//  var items: Observable<[SectionRecommend]> { get }
//}
//protocol RecommendViewModelType {
//  var outputs: RecommendViewModelOutput? { get }
//}
//
//class RecommnedViewModel: RecommendViewModelType {
//  var outputs: RecommendViewModelOutput?
//
//  private var itemsRelay = BehaviorRelay<[SectionRecommend]>(value: [])
//
//  init() {
//    self.outputs = self
//    sampleRecommnedData()
//  }
//
//
//}
//extension RecommnedViewModel: RecommendViewModelOutput {
//  var items: Observable<[SectionRecommend]> {
//    return itemsRelay.asObservable()
//  }
//}

class RecommendViewModel {
  
  struct Input {}
  
  struct Output {
    var items: Observable<[SectionRecommend]>
  }
  
  private var _input: RecommendViewModel.Input!
  private var _output: RecommendViewModel.Output!
  
  private let model = RecommendModel()
  private let disposeBag = DisposeBag()
  
  private var itemsRelay = BehaviorRelay<[SectionRecommend]>(value: [])
  
  init(trigger: RecommendViewModel.Input) {
    _input = trigger
    _output = RecommendViewModel.Output.init(items: itemsRelay.asObservable())
    // get
    bind()
  }
  
  private func bind() {
    model.getRecommendMusicList { [weak self] items in
      print("item", items)
      self?.itemsRelay.accept(items)
    }
  }
  
  // MARK: -- OUTPUT
  func output() -> RecommendViewModel.Output {
    return _output
  }
}
