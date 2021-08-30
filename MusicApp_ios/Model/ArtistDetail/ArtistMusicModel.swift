//
//  ArtistMusicModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/30.
//

import Foundation
import Firebase
import Ballcap

class ArtistMusicModel {
  
  var dataSource: DataSource<Document<Musics.music>> = []
  
  func getArtistMusicList(_ completion: @escaping(_ items: [MusicItem]) -> Void) {
    var item: [Document<Musics.music>] = []
    
    let ref = db.collection("Music")
    dataSource = DataSource<Document<Musics.music>>.Query(ref)
      .dataSource()
      .onCompleted({ [weak self] snapshot, documentSnapshot in
        item = documentSnapshot
        print("dataSource", self?.dataSource ?? [])
        print("items", item)
        if let modifiedItems = self?.modifiedItems(item) {
          completion(modifiedItems)
        }
      })
      .listen()
  }
  
  private func modifiedItems(_ items: [Document<Musics.music>]) -> [MusicItem] {
    var data: [MusicItem] = []
    for item in items {
      if let name = item.data?.name{
        data.append(
          MusicItem(
            name: name
          )
        )
      }
    }
    return data
  }
  
}
