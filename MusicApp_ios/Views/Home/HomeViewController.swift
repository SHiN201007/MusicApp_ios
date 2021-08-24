//
//  HomeViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/06/28.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HomeViewController: BaseViewController {
  
  @IBOutlet weak var backView: UIView!
  // recommend
  @IBOutlet weak var recommendLabel: UILabel!
  @IBOutlet weak var recommendDescriptLabel: UILabel!
  @IBOutlet weak var recommendButton: UIButton!
  // recommend views
  /// 1
  @IBOutlet weak var recommend1BackView: UIView!
  @IBOutlet weak var recommend1MusicImageView: UIImageView!
  @IBOutlet weak var recommend1TitleLabel: UILabel!
  @IBOutlet weak var recommend1ArtistLabel: UILabel!
  @IBOutlet weak var recommend1PreViewLabel: UILabel!
  @IBOutlet weak var recommend1MenuImageView: UIImageView!
  /// 2
  @IBOutlet weak var recommend2BackView: UIView!
  @IBOutlet weak var recommend2MusicImageView: UIImageView!
  @IBOutlet weak var recommend2TitleLabel: UILabel!
  @IBOutlet weak var recommend2ArtistLabel: UILabel!
  @IBOutlet weak var recommend2PreViewLabel: UILabel!
  @IBOutlet weak var recommend2MenuImageView: UIImageView!
  /// 3
  @IBOutlet weak var recommend3BackView: UIView!
  @IBOutlet weak var recommend3MusicImageView: UIImageView!
  @IBOutlet weak var recommend3TitleLabel: UILabel!
  @IBOutlet weak var recommend3ArtistLabel: UILabel!
  @IBOutlet weak var recommend3PreViewLabel: UILabel!
  @IBOutlet weak var recommend3MenuImageView: UIImageView!
  /// 4
  @IBOutlet weak var recommend4BackView: UIView!
  @IBOutlet weak var recommend4MusicImageView: UIImageView!
  @IBOutlet weak var recommend4TitleLabel: UILabel!
  @IBOutlet weak var recommend4ArtistLabel: UILabel!
  @IBOutlet weak var recommend4PreViewLabel: UILabel!
  @IBOutlet weak var recommend4MenuImageView: UIImageView!
  // artists
  @IBOutlet weak var artistLabel: UILabel!
  @IBOutlet weak var artistDescriptLabel: UILabel!
  @IBOutlet weak var artistButton: UIButton!
  @IBOutlet weak var collectionView: UICollectionView!
  // ranking
  @IBOutlet weak var rankingLabel: UILabel!
  @IBOutlet weak var rankingDescriptLabel: UILabel!
  @IBOutlet weak var rankingButton: UIButton!
  /// 1
  @IBOutlet weak var ranking1BackView: UIView!
  @IBOutlet weak var ranking1MusicImageView: UIImageView!
  @IBOutlet weak var ranking1TitleLabel: UILabel!
  @IBOutlet weak var ranking1CompareImageView: UIImageView!
  @IBOutlet weak var ranking1CompareLabel: UILabel!
  @IBOutlet weak var ranking1ArtistLabel: UILabel!
  @IBOutlet weak var ranking1PreViewLabel: UILabel!
  @IBOutlet weak var ranking1MenuImageView: UIImageView!
  /// 2
  @IBOutlet weak var ranking2BackView: UIView!
  @IBOutlet weak var ranking2MusicImageView: UIImageView!
  @IBOutlet weak var ranking2TitleLabel: UILabel!
  @IBOutlet weak var ranking2CompareImageView: UIImageView!
  @IBOutlet weak var ranking2CompareLabel: UILabel!
  @IBOutlet weak var ranking2ArtistLabel: UILabel!
  @IBOutlet weak var ranking2PreViewLabel: UILabel!
  @IBOutlet weak var ranking2MenuImageView: UIImageView!
  /// 3
  @IBOutlet weak var ranking3BackView: UIView!
  @IBOutlet weak var ranking3MusicImageView: UIImageView!
  @IBOutlet weak var ranking3TitleLabel: UILabel!
  @IBOutlet weak var ranking3CompareImageView: UIImageView!
  @IBOutlet weak var ranking3CompareLabel: UILabel!
  @IBOutlet weak var ranking3ArtistLabel: UILabel!
  @IBOutlet weak var ranking3PreViewLabel: UILabel!
  @IBOutlet weak var ranking3MenuImageView: UIImageView!
  /// 4
  @IBOutlet weak var ranking4BackView: UIView!
  @IBOutlet weak var ranking4MusicImageView: UIImageView!
  @IBOutlet weak var ranking4TitleLabel: UILabel!
  @IBOutlet weak var ranking4CompareImageView: UIImageView!
  @IBOutlet weak var ranking4CompareLabel: UILabel!
  @IBOutlet weak var ranking4ArtistLabel: UILabel!
  @IBOutlet weak var ranking4PreViewLabel: UILabel!
  @IBOutlet weak var ranking4MenuImageView: UIImageView!
  /// 5
  @IBOutlet weak var ranking5BackView: UIView!
  @IBOutlet weak var ranking5MusicImageView: UIImageView!
  @IBOutlet weak var ranking5TitleLabel: UILabel!
  @IBOutlet weak var ranking5CompareImageView: UIImageView!
  @IBOutlet weak var ranking5CompareLabel: UILabel!
  @IBOutlet weak var ranking5ArtistLabel: UILabel!
  @IBOutlet weak var ranking5PreViewLabel: UILabel!
  @IBOutlet weak var ranking5MenuImageView: UIImageView!
  
  private let disposeBag = DisposeBag()
  
  // tapGuesture
  /// recommend
  private var recommendTapGuesture1: UITapGestureRecognizer!
  private var recommendTapGuesture2: UITapGestureRecognizer!
  private var recommendTapGuesture3: UITapGestureRecognizer!
  private var recommendTapGuesture4: UITapGestureRecognizer!
  /// ranking
  private var rankingTapGuesture1: UITapGestureRecognizer!
  private var rankingTapGuesture2: UITapGestureRecognizer!
  private var rankingTapGuesture3: UITapGestureRecognizer!
  private var rankingTapGuesture4: UITapGestureRecognizer!
  private var rankingTapGuesture5: UITapGestureRecognizer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    setupCollectionView()
    setupDatas()
    setupTapItems()
  }
  
  private func configure() {
    disposeBag.insert {
      recommendButton.rx.tap
        .subscribe(onNext: { [weak self] in
          self?.showViewController(vc: RecommendViewController())
        })
      
      artistButton.rx.tap
        .subscribe(onNext: {
          
        })
      
      rankingButton.rx.tap
        .subscribe(onNext: {
          
        })
    }
  }
  
  private func setupTapItems() {
    // recommend
    recommendTapGuesture1 = UITapGestureRecognizer()
    recommendTapGuesture2 = UITapGestureRecognizer()
    recommendTapGuesture3 = UITapGestureRecognizer()
    recommendTapGuesture4 = UITapGestureRecognizer()
    // ranking
    rankingTapGuesture1 = UITapGestureRecognizer()
    rankingTapGuesture2 = UITapGestureRecognizer()
    rankingTapGuesture3 = UITapGestureRecognizer()
    rankingTapGuesture4 = UITapGestureRecognizer()
    rankingTapGuesture5 = UITapGestureRecognizer()
    
    // addTapGuestures
    /// recommend
    setupTapGesture(view: recommend1BackView,
                    tapGuesture: recommendTapGuesture1)
    setupTapGesture(view: recommend2BackView,
                    tapGuesture: recommendTapGuesture2)
    setupTapGesture(view: recommend3BackView,
                    tapGuesture: recommendTapGuesture3)
    setupTapGesture(view: recommend4BackView,
                    tapGuesture: recommendTapGuesture4)
    /// rankling
    setupTapGesture(view: ranking1BackView,
                    tapGuesture: rankingTapGuesture1)
    setupTapGesture(view: ranking2BackView,
                    tapGuesture: rankingTapGuesture2)
    setupTapGesture(view: ranking3BackView,
                    tapGuesture: rankingTapGuesture3)
    setupTapGesture(view: ranking4BackView,
                    tapGuesture: rankingTapGuesture4)
    setupTapGesture(view: ranking5BackView,
                    tapGuesture: rankingTapGuesture5)
    
    // MARK:-- ACTIONS
    disposeBag.insert {
      /// recommend
      recommendTapGuesture1.rx.event
        .subscribe(onNext: { _ in
          print("tap recommned 1")
          self.showMusicViewController()
        })
      recommendTapGuesture2.rx.event
        .subscribe(onNext: { _ in
          print("tap recommned 2")
          self.showMusicViewController()
        })
      recommendTapGuesture3.rx.event
        .subscribe(onNext: { _ in
          print("tap recommned 3")
          self.showMusicViewController()
        })
      recommendTapGuesture4.rx.event
        .subscribe(onNext: { _ in
          print("tap recommned 4")
          self.showMusicViewController()
        })
      /// ranking
      rankingTapGuesture1.rx.event
        .subscribe(onNext: { _ in
          print("tap ranking 1")
          self.showMusicViewController()
        })
      rankingTapGuesture2.rx.event
        .subscribe(onNext: { _ in
          print("tap ranking 2")
          self.showMusicViewController()
        })
      rankingTapGuesture3.rx.event
        .subscribe(onNext: { _ in
          print("tap ranking 3")
          self.showMusicViewController()
        })
      rankingTapGuesture4.rx.event
        .subscribe(onNext: { _ in
          print("tap ranking 4")
          self.showMusicViewController()
        })
      rankingTapGuesture5.rx.event
        .subscribe(onNext: { _ in
          print("tap ranking 5")
          self.showMusicViewController()
        })
    }
  }
  
  private func showMusicViewController() {
    let vc = MusicViewController()
    self.present(vc, animated: true, completion: nil)
  }
  
  private func showViewController(vc: UIViewController) {
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  // MARK: -- SAMPLE DATA
  private func setupDatas() {
    setupRecommedData()
    setupRankingData()
  }
  
  // sample recommend
  private func setupRecommedData() {
    recommend1MusicImageView.image = UIImage(named: "oneokrock")
    recommend2MusicImageView.image = UIImage(named: "oneokrock")
    recommend3MusicImageView.image = UIImage(named: "oneokrock")
    recommend4MusicImageView.image = UIImage(named: "oneokrock")
  }
  // sample ranking
  private func setupRankingData() {
    ranking1MusicImageView.image = UIImage(named: "oneokrock")
    ranking2MusicImageView.image = UIImage(named: "oneokrock")
    ranking3MusicImageView.image = UIImage(named: "oneokrock")
    ranking4MusicImageView.image = UIImage(named: "oneokrock")
    ranking5MusicImageView.image = UIImage(named: "oneokrock")
    // compare
    let current = UIImage(named: "compare_current")
    let up = UIImage(named: "compare_up")
    let down = UIImage(named: "compare_down")
    ranking1CompareImageView.image = current
    ranking2CompareImageView.image = up
    ranking3CompareImageView.image = down
    ranking4CompareImageView.image = current
    ranking5CompareImageView.image = up
  }

}
// MARK: -- layoutConfigure
extension HomeViewController {
  override func viewWillLayoutSubviews() {
    layoutConfigure()
    setupCollectionView()
  }
  private func layoutConfigure() {
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    // view
    self.view.backgroundColor = .backgroundColor()
    backView.backgroundColor = .backgroundColor()
    // Recommend
    setupTitleLayout(titleLabel: recommendLabel, descriptLabel: recommendDescriptLabel, button: recommendButton)
    /// 1
    setupRecommendView(musicImageView: recommend1MusicImageView,
                       titleLabel: recommend1TitleLabel,
                       artistLabel: recommend1ArtistLabel,
                       preViewLabel: recommend1PreViewLabel,
                       menuImageView: recommend1MenuImageView)
    /// 2
    setupRecommendView(musicImageView: recommend2MusicImageView,
                       titleLabel: recommend2TitleLabel,
                       artistLabel: recommend2ArtistLabel,
                       preViewLabel: recommend2PreViewLabel,
                       menuImageView: recommend2MenuImageView)
    /// 3
    setupRecommendView(musicImageView: recommend3MusicImageView,
                       titleLabel: recommend3TitleLabel,
                       artistLabel: recommend3ArtistLabel,
                       preViewLabel: recommend3PreViewLabel,
                       menuImageView: recommend3MenuImageView)
    /// 4
    setupRecommendView(musicImageView: recommend4MusicImageView,
                       titleLabel: recommend4TitleLabel,
                       artistLabel: recommend4ArtistLabel,
                       preViewLabel: recommend4PreViewLabel,
                       menuImageView: recommend4MenuImageView)
    // Artist
    setupTitleLayout(titleLabel: artistLabel, descriptLabel: artistDescriptLabel, button: artistButton)
    collectionView.backgroundColor = .backgroundColor()
    // Ranking
    setupTitleLayout(titleLabel: rankingLabel, descriptLabel: rankingDescriptLabel, button: rankingButton)
    /// 1
    setupRankingView(musicImageView: ranking1MusicImageView,
                     compareImageView: ranking1CompareImageView,
                     titleLabel: ranking1TitleLabel,
                     artistLabel: ranking1ArtistLabel,
                     preViewLabel: ranking1PreViewLabel,
                     menuImageView: ranking1MenuImageView)
    /// 2
    setupRankingView(musicImageView: ranking2MusicImageView,
                     compareImageView: ranking2CompareImageView,
                     titleLabel: ranking2TitleLabel,
                     artistLabel: ranking2ArtistLabel,
                     preViewLabel: ranking2PreViewLabel,
                     menuImageView: ranking2MenuImageView)
    /// 3
    setupRankingView(musicImageView: ranking3MusicImageView,
                     compareImageView: ranking3CompareImageView,
                     titleLabel: ranking3TitleLabel,
                     artistLabel: ranking3ArtistLabel,
                     preViewLabel: ranking3PreViewLabel,
                     menuImageView: ranking3MenuImageView)
    /// 4
    setupRankingView(musicImageView: ranking4MusicImageView,
                     compareImageView: ranking4CompareImageView,
                     titleLabel: ranking4TitleLabel,
                     artistLabel: ranking4ArtistLabel,
                     preViewLabel: ranking4PreViewLabel,
                     menuImageView: ranking4MenuImageView)
    /// 5
    setupRankingView(musicImageView: ranking5MusicImageView,
                     compareImageView: ranking5CompareImageView,
                     titleLabel: ranking5TitleLabel,
                     artistLabel: ranking5ArtistLabel,
                     preViewLabel: ranking5PreViewLabel,
                     menuImageView: ranking5MenuImageView)
  }
  
  // title
  private func setupTitleLayout(titleLabel: UILabel, descriptLabel: UILabel, button: UIButton) {
    /// title
    titleLabel.textColor = .mainColor()
    titleLabel.font = .boldSystemFont(ofSize: 20)
    /// descript
    descriptLabel.textColor = .textColor()
    /// button
    button.contentHorizontalAlignment = .right
    button.setTitleColor(.textColor(), for: .normal)
  }
  
  // recommend
  private func setupRecommendView(musicImageView: UIImageView, titleLabel: UILabel, artistLabel: UILabel, preViewLabel: UILabel, menuImageView: UIImageView) {
    musicImageView.contentMode = .scaleAspectFill
    musicImageView.layer.cornerRadius = 5.0
    titleLabel.textColor = .textColor()
    artistLabel.textColor = .placeHolderColor()
    preViewLabel.textColor = .placeHolderColor()
    menuImageView.image = UIImage(named: "menu")?.withTintColor(.textColor())
  }
  
  // ranking
  private func setupRankingView(musicImageView: UIImageView, compareImageView: UIImageView, titleLabel: UILabel, artistLabel: UILabel, preViewLabel: UILabel, menuImageView: UIImageView) {
    musicImageView.contentMode = .scaleAspectFill
    musicImageView.layer.cornerRadius = 5.0
    compareImageView.contentMode = .scaleAspectFit
    titleLabel.textColor = .textColor()
    artistLabel.textColor = .placeHolderColor()
    preViewLabel.textColor = .placeHolderColor()
    menuImageView.image = UIImage(named: "menu")?.withTintColor(.textColor())
  }
  
  // collectionView
  private func setupCollectionView() {
    let nib = UINib(nibName: "ArtistCollectionViewCell", bundle: .main)
    collectionView.register(nib, forCellWithReuseIdentifier: "ArtistCell")
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.showsHorizontalScrollIndicator = false
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 120, height: 120)
    collectionView.collectionViewLayout = layout
  }
  
  // add tapGesture
  private func setupTapGesture(view: UIView, tapGuesture: UITapGestureRecognizer) {
    view.isUserInteractionEnabled = true
    view.addGestureRecognizer(tapGuesture)
  }
}
// MARK: -- UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistCell", for: indexPath) as! ArtistCollectionViewCell
    
    cell.artistImageView.image = UIImage(named: "oneokrock")
    cell.artistNameLabel.text = "ONE OK ROCK"
    
    return cell
  }
}
// MARK: -- UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
  
}
