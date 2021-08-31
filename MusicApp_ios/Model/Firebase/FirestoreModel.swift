//
//  FirestoreModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/14.
//

import Foundation
import Firebase
//import Pring
//import Muni

import Ballcap

//MARK: -- User
class Users: Object, DataRepresentable & HierarchicalStructurable {
  var data: user?
  // NestedCollection
  var favorite: [Favorites] = []
  var recommend: [Recommends] = []
  var history: [Histories] = []
  
  struct user: Modelable & Codable {
    var name: String = ""
    var gender: Int = 0
  }
  
  enum CollectionKeys: String {
    case favorite
    case recommend
    case history
  }
}

//MARK: -- Favorite
class Favorites: Object {
  var data: favorite?
  
  struct favorite: Modelable & Codable {
    var musicId: String = ""
    var artistId: String = ""
    var albumId: String = ""
  }
}

//MARK: -- Recommend
class Recommends: Object {
  var data: recommend?

  struct recommend: Modelable & Codable {
    var re_music_id: String = ""
  }
}

//MARK: -- History
class Histories: Object {
  var data: history?
  
  struct history: Modelable & Codable {
    var musicId: String = ""
  }
}

// MARK: -- Music
class Musics: Object {
  var data: music?
  
  struct music: Modelable & Codable {
    var name: String = ""
    var artistId: String = ""
  }
}

// MARK: -- Album
class Albums: Object {
  var data: album?
  
  struct album: Modelable & Codable {
    var name: String = ""
    var artistId: String = ""
    var musicIds: [String] = []
    var thumbnailURL: String = ""
  }
}

// MARK: -- Artists
class Artists: Object {
  var data: artist?
  
  struct artist: Modelable & Codable {
    var name: String = ""
  }
}
