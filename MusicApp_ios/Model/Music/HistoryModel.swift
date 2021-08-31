//
//  HistoryModel.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/31.
//

import Foundation
import Firebase
import Ballcap

class HistoryModel {
  
  var musicList = [
    "6t6XLQ5QOq25RUqsdu7i",
    "CKuhNZuHU8CzMKu4Kgt7",
    "F7i35TDqfZ1WeKZ3Y5uj",
    "FrGI1SnZhc3JcdnVn9Yl",
    "GrCnkyGspijDfGSM6Owj",
    "J324ZJSbCIFOKIemoejo",
    "QaiVWng5ImTG1lHDX0vV",
    "TR2mpqikExxlYeU8yGNM",
    "e885zr2CWC9DdkmJFtjr",
    "ivR8Gm3c6PV4ghAzzPle",
    "k4lR5jk3TTbaKmtI4TGq",
    "oFNy5R6lLdzFfAw9TAIc",
    "piKmxfifcIa1lWRi617b",
    "vSp1eZxsNmhT42untxvP",
    "zEXN1DoqO8gohPZY6YO1"
  ]
  
  
  func insertHistoryData() {
    guard let uid: String = Auth.auth().currentUser?.uid else { return }
    let ref = db.collection("User").document(uid).collection("History")
    
    let batch = Batch()
    
    let modifiedMusicList = musicList.shuffled()
    
    for index in 0..<5 {
      let history: Document<Histories.history> = Document()
      history.data?.histry_music_id = modifiedMusicList[index]
      batch.save(history, to: ref)
    }
    
    batch.commit({ error in
      if let _error = error {
        print("error")
        print(_error.localizedDescription)
      }
      print("success")
    })
  }
}
