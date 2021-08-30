//
//  RecommendItem.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/31.
//

import Foundation
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
