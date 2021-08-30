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

struct RecommendItem {
  var musicImage: String
  var title: String
  var artist: String
  var preview: Int
}

struct SectionRecommend {
  var items: [Item]
}
extension SectionRecommend: SectionModelType {
  typealias Item = RecommendItem

  init(original: SectionRecommend, items: [SectionRecommend.Item]) {
    self = original
    self.items = items
  }
}

protocol RecommendViewModelOutput {
  var items: Observable<[SectionRecommend]> { get }
}
protocol RecommendViewModelType {
  var outputs: RecommendViewModelOutput? { get }
}

class RecommnedViewModel: RecommendViewModelType {
  var outputs: RecommendViewModelOutput?
  
  private var itemsRelay = BehaviorRelay<[SectionRecommend]>(value: [])
  
  init() {
    self.outputs = self
    sampleRecommnedData()
  }
  
  private func sampleRecommnedData() {
    var items: [SectionRecommend] = []
    
    for _ in 0...10 {
      items.append(SectionRecommend(items: [SectionRecommend.Item(musicImage: "oneokrock",
                                                                  title: "Cry Baby",
                                                                  artist: "Official髭男dism",
                                                                  preview: 101232)]))
    }
    itemsRelay.accept(items)
  }
}
extension RecommnedViewModel: RecommendViewModelOutput {
  var items: Observable<[SectionRecommend]> {
    return itemsRelay.asObservable()
  }
}
