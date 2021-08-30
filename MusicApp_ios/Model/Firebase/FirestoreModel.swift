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
  var data: users?
  // NestedCollection
  var favorite: [Favorites] = []
  var recommend: [Recommends] = []
  var history: [Histories] = []
  
  struct users: Modelable & Codable {
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
  var data: Favorites?
  
  struct Favorite: Modelable & Codable {
    var musicId: String = ""
    var artistId: String = ""
    var albumId: String = ""
  }
}

//MARK: -- Recommend
class Recommends: Object {
  var data: Recommends?

  struct Recommend: Modelable & Codable {
    var musicId: String = ""
  }
}

//MARK: -- History
class Histories: Object {
  var data: History?
  
  struct History: Modelable & Codable {
    var musicId: String = ""
  }
}

// MARK: -- Music
class Musics: Object {
  var data: Musics?
  
  struct Musics: Modelable & Codable {
    var name: String = ""
    var musicUrl: String = ""
    var genre: Int = 0
    var count: Int = 0
    var artistId: String = ""
  }
}

// MARK: -- Album
class Albums: Object {
  var data: Album?
  
  struct Album: Modelable & Codable {
    var name: String = ""
    var artistId: String = ""
    var musicIds: [String] = []
  }
}

// MARK: -- Artists
class Artists: Object {
  var data: Artist?
  
  struct Artist: Modelable & Codable {
    var name: String = ""
  }
}
