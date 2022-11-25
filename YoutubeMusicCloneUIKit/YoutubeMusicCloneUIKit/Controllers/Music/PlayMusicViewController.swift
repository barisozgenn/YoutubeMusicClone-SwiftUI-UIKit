//
//  PlayMusicViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 24.11.2022.
//

import UIKit
class PlayMusicViewController: UIViewController, MusicSelectedDelegate {
    
    //MARK: - Properties
    
    lazy var foldedViewHeight = 74.0
    lazy var expandedViewHeight = 92.0
    private var viewModel : MusicViewModel?
    
    private lazy var bottomBorder: UIView = {
        let bottomBorder = UIView()
        bottomBorder.frame = CGRect(x: 0, y: view.height - 4, width: view.width, height: 1)
        bottomBorder.backgroundColor = .gray.withAlphaComponent(0.29)
        return bottomBorder
    }()
    
    private lazy var musicBackgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "youtube-music-app-clone-logo")
        iv.layer.opacity = 0
        iv.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        return iv
    }()
    
    private let musicImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = .gray.withAlphaComponent(0.58)
        iv.layer.cornerRadius = 4
        iv.frame = CGRect(x: 29, y: 14, width: 48, height: 48)
        return iv
    }()
    
    private lazy var artistButton: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = " ".capitalized
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 2
        label.frame = CGRect(x: 92, y: 35, width: view.width - 120, height: 35)
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = " ".capitalized
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 2
        label.frame = CGRect(x: 92, y: 10, width: view.width - 120, height: 35)
        return label
    }()
    
    private lazy var playAndReflectButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.frame = CGRect(x: self.view.right - 107, y: 20, width: 35, height: 35)
        button.addTarget(self, action: #selector(didTapPlay), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var nextAndOptionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "forward.end.fill"), for: .normal)
        button.frame = CGRect(x: self.view.right - 55, y: 20, width: 35, height: 35)
        return button
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.frame = CGRect(x: 29, y: 60, width: 35, height: 35)
        button.layer.opacity = 0
        button.addTarget(self, action: #selector(didTapPlayView), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        button.frame = CGRect(x: self.view.width - (29 + 35), y: 100 + self.view.width, width: 35, height: 35)
        button.addTarget(self, action: #selector(didTapLike(_ :)), for: .touchUpInside)
        button.layer.opacity = 0
        return button
    }()
    
    private lazy var unlikeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        button.frame = CGRect(x: 29, y: 100 + self.view.width, width: 35, height: 35)
        button.addTarget(self, action: #selector(didTapLike(_ :)), for: .touchUpInside)
        button.layer.opacity = 0
        return button
    }()
    
    private lazy var durationSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 0
        slider.maximumValue = 0
        slider.frame = CGRect(x: 29, y: 200 + view.width, width: view.width - 58, height: 35)
        slider.layer.opacity = 0
        return slider
    }()
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Notification
    @objc func showMusicDetailScreen(_ notification: Notification) {
        if let viewModel = notification.object as? MusicViewModel {
            view.layer.opacity = 1
            viewModel.downloadImage {[weak self] image in
                
                self?.musicBackgroundImageView.image = image
                self?.musicImageView.image = image
                
                self?.titleLabel.text = viewModel.title
                self?.artistButton.text = viewModel.artist
                
                self?.durationSlider.maximumValue = Float(viewModel.music.durationInSeconds)
                
                self?.musicBackgroundImageView.setHeight(self?.expandedViewHeight ?? 100)
                self?.musicBackgroundImageView.setWidth(self?.expandedViewHeight ?? 100)
                
                let blurEffect = UIBlurEffect(style: .light)
                let blurEffectView = UIVisualEffectView(effect: blurEffect)
                if let bounds = self?.view.bounds {
                    blurEffectView.frame =  bounds
                    blurEffectView.tag = 129
                    self?.musicBackgroundImageView.addSubview(blurEffectView)
                }
                
                
                UIView.animate(withDuration: 0.7) {
                    
                    self?.musicBackgroundImageView.layer.opacity = 0.29
                    
                }
            }
            didTapPlayView()
        }
        
    }
    
    //MARK: - Helpers
    
    func setupUI(){
        view.layer.opacity = 0
        view.frame = CGRect(x: 0, y: self.view.height - (foldedViewHeight + 82), width: self.view.width, height: foldedViewHeight)
        
        view.addSubview(bottomBorder)
        view.addSubview(musicBackgroundImageView)
        
        view.clipsToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapPlayView))
        view.addGestureRecognizer(tap)
        
        view.backgroundColor = UIColor.theme.tabBarBackgroundColor ?? .gray
        
        NotificationCenter.default.addObserver(self, selector: #selector(showMusicDetailScreen(_:)), name: NSNotification.Name(PLAY_MUSIC_VIEW_NOTIFICATION_NAME), object: viewModel)
        
        view.addSubview(musicImageView)
        
        view.addSubview(titleLabel)
        
        view.addSubview(artistButton)
        
        view.addSubview(playAndReflectButton)
        view.addSubview(nextAndOptionButton)
        view.addSubview(closeButton)
        
        view.addSubview(likeButton)
        view.addSubview(unlikeButton)
        
        view.addSubview(durationSlider)
    }
    
    //MARK: - Animations
    
    func foldingAnimationQuick(){
        closeButton.layer.opacity = 0
        
        playAndReflectButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playAndReflectButton.frame = CGRect(x: view.right - 107, y: 20, width: 35, height: 35)
        nextAndOptionButton.setImage(UIImage(systemName: "forward.end.fill"), for: .normal)
        nextAndOptionButton.frame = CGRect(x: view.right - 55, y: 20, width: 35, height: 35)
        musicBackgroundImageView.layer.opacity = 0
        
        titleLabel.frame = CGRect(x: 92, y: 10, width: view.width - 120, height: 35)
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        artistButton.frame = CGRect(x: 92, y: 35, width: view.width - 120, height: 35)
        artistButton.textAlignment = .left
        
        likeButton.layer.opacity = 0
        unlikeButton.layer.opacity = 0
        durationSlider.layer.opacity = 0
    }
    func foldingAnimationSlow(){
        
        bottomBorder.backgroundColor = .gray.withAlphaComponent(0.29)
        musicImageView.frame = CGRect(x: 29, y: 14, width: 48, height: 48)
        
    }
    func expandingAnimationQuick(){
        bottomBorder.backgroundColor = .gray.withAlphaComponent(0)
        
        playAndReflectButton.setImage(UIImage(systemName: "dot.radiowaves.up.forward"), for: .normal)
        playAndReflectButton.frame = CGRect(x: view.right - 100, y: 60, width: 35, height: 35)
        nextAndOptionButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        nextAndOptionButton.frame = CGRect(x: view.right - 60, y: 60, width: 35, height: 35)
        
        titleLabel.frame = CGRect(x: 70, y: 100 + view.width, width: view.width - 140, height: 40)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        
        artistButton.frame = CGRect(x: 60, y: 130 + view.width, width: view.width - 120, height: 40)
        artistButton.textAlignment = .center
    }
    func expandingAnimationSlow(){
        
        musicImageView.frame = CGRect(x: 29, y: 129, width: view.width - 58, height: view.width - 58)
        
        musicBackgroundImageView.layer.opacity = 0.29
        closeButton.layer.opacity = 1
        
        likeButton.layer.opacity = 1
        unlikeButton.layer.opacity = 1
        durationSlider.layer.opacity = 1
    }
    
    //MARK: - Actions
    
    @objc func didTapPlayView(){
        guard let bottomMusicPlayView = self.view else {return}
        
        NotificationCenter.default.post(name: NSNotification.Name(TABBAR_NOTIFICATION_NAME),
                                        object: nil,
                                        userInfo: nil)
        
        if bottomMusicPlayView.frame.height == foldedViewHeight {
            UIView.animate(withDuration: 0.01, animations: {
                
                bottomMusicPlayView.frame =  CGRect(x: 0, y: self.expandedViewHeight - (self.foldedViewHeight + 82), width: self.view.width, height: self.foldedViewHeight + 200 )
                
                self.expandingAnimationQuick()
                
            }) {_ in
                UIView.animate(withDuration: 0.7) {
                    
                    bottomMusicPlayView.frame = CGRect(x: 0, y: 0, width: self.view.width, height: self.expandedViewHeight)
                    
                    self.expandingAnimationSlow()
                }
            }
        }else {
            UIView.animate(withDuration: 0.01, animations: {
                
                bottomMusicPlayView.frame =  CGRect(x: 0, y: 0, width: self.view.width, height: self.expandedViewHeight + 200)
                
                self.foldingAnimationQuick()
                
            }) {_ in
                UIView.animate(withDuration: 0.7) {
                    bottomMusicPlayView.frame =  CGRect(x: 0, y: self.expandedViewHeight - (self.foldedViewHeight + 82), width: self.view.width, height: self.foldedViewHeight)
                    
                    self.foldingAnimationSlow()
                    
                    if let blurEffectView = self.view.subviews.first(where: { $0.tag == 129 }) {
                        blurEffectView.removeFromSuperview()
                    }
                }
            }
        }
        
    }
    
    @objc func didTapPlay(){
        playAndReflectButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }
    
    @objc func didTapLike(_ sender: UIButton){
        if sender == likeButton {
            if likeButton.currentImage == UIImage(systemName: "hand.thumbsup.fill") {
                likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            }else {
                likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            }
            
            unlikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        }else {
            if unlikeButton.currentImage == UIImage(systemName: "hand.thumbsup.fill") {
                unlikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
            }else {
                unlikeButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
            }
            likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            
        }
    }
}
