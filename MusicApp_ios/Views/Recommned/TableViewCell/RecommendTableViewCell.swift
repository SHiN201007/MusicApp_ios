//
//  RecommendTableViewCell.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/24.
//

import UIKit
import RxSwift
import RxCocoa

class RecommendTableViewCell: UITableViewCell {

  @IBOutlet weak var recommendBackView: UIView!
  @IBOutlet weak var recommendMusicImageView: UIImageView!
  @IBOutlet weak var recommendTitleLabel: UILabel!
  @IBOutlet weak var recommendArtistLabel: UILabel!
  @IBOutlet weak var recommendPreViewLabel: UILabel!
  @IBOutlet weak var recommendMenuImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    layoutConfigure()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  private func layoutConfigure() {
    setupRecommendView(musicImageView: recommendMusicImageView,
                       titleLabel: recommendTitleLabel,
                       artistLabel: recommendArtistLabel,
                       preViewLabel: recommendPreViewLabel,
                       menuImageView: recommendMenuImageView)
  }
  
  private func setupRecommendView(musicImageView: UIImageView, titleLabel: UILabel, artistLabel: UILabel, preViewLabel: UILabel, menuImageView: UIImageView) {
    musicImageView.contentMode = .scaleAspectFill
    musicImageView.layer.cornerRadius = 5.0
    titleLabel.textColor = .textColor()
    artistLabel.textColor = .placeHolderColor()
    preViewLabel.textColor = .placeHolderColor()
    menuImageView.image = UIImage(named: "menu")?.withTintColor(.textColor())
  }
    
}
