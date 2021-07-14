//
//  FirestoreModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/14.
//

import Foundation
import Firebase
import Pring
import Muni

extension Firestore {
  @objcMembers
  class User: Object, UserProtocol {
    
    dynamic var thumbnailImage: File? // nil
    
    dynamic var name: String?
    dynamic var gender: Int = 0
    dynamic var Favorite: NestedCollection<Favorite> = []
    dynamic var Recommend: NestedCollection<Recommend> = []
    dynamic var History: NestedCollection<History> = []
  }
  
  // MARK: -- Favorite
  @objcMembers
  class Favorite: Object {
    dynamic var musicId: String = ""
    dynamic var artistId: String = ""
    dynamic var albumId: String = ""
  }
  // MARK: -- Recommend
  @objcMembers
  class Recommend: Object {
    dynamic var musicId: String = ""
  }
  // MARK: -- Recommend
  @objcMembers
  class History: Object {
    dynamic var musicId: String = ""
  }
    
    
  // MARK:-- Music
  @objcMembers
  class Music: Object {
    dynamic var name: String = ""
    dynamic var musicUrl: String = ""
    dynamic var genre: Int = 0
    dynamic var count: Int = 0
    dynamic var artistId: String = ""
  }
  
  // MARK:-- Album
  @objcMembers
  class Album: Object {
    dynamic var name: String = ""
    dynamic var artistId: String = ""
    dynamic var musicIds: [String] = []
  }
  
  @objcMembers
  class Artist: Object {
    dynamic var name: String = ""
  }
}
