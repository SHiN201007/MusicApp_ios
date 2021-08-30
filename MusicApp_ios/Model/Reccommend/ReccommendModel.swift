//
//  ReccommendModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/31.
//

import Foundation
import Firebase
import Ballcap

class RecommendModel {
  
  var dataSource: DataSource<Document<Recommends.recommend>> = []
  
  func getRecommendMusicList(_ completion: @escaping(_ items: [SectionRecommend]) -> Void) {
    var item: [Document<Recommends.recommend>] = []
    guard let uid: String = Auth.auth().currentUser?.uid else { return }
    let ref = db.collection("User").document(uid).collection("Recommend")
    dataSource = DataSource<Document<Recommends.recommend>>.Query(ref)
      .dataSource()
      .onCompleted({ [weak self] snapshot, documentSnapshot in
        item = documentSnapshot
        self?.modifiedItems(item) { modifiedItems in
          completion(modifiedItems)
        }
      })
      .listen()
  }
  
  private func modifiedItems(_ items: [Document<Recommends.recommend>], completion: @escaping([SectionRecommend]) -> Void) {
    let dispatchGroup = DispatchGroup()
    let dispatchQueue = DispatchQueue(label: "queue", attributes: .concurrent)
    
    var data: [SectionRecommend] = []
    for item in items {
      if let musicId = item.data?.re_music_id {
        dispatchGroup.enter()
        dispatchQueue.async(group: dispatchGroup) { [weak self] in
          self?.getData(musicId: musicId) {
            print("error")
          } succsess: { title in
            data.append(
              SectionRecommend(
                items: [
                  SectionRecommend.Item(
                    musicImage: "oneokrock",
                    title: title,
                    artist: "artist",
                    preview: 100000)
                ]
              )
            )
            dispatchGroup.leave()
          }
        }
        
      }
    }
    
    dispatchGroup.notify(queue: .main) {
      completion(data)
    }
  }
  
  func getData(musicId: String, failure: @escaping() -> Void, succsess: @escaping(String) -> Void) {
    let ref = db.collection("Music").document(musicId)
    Document<Musics.music>.get(documentReference: ref, completion: { document, error in
      if let _error = error {
        print("error", _error)
        failure()
      }
      if let _document = document,
         let title = _document.data?.name {
        succsess(title)
      }else {
        failure()
      }
    })
  }
  
}
