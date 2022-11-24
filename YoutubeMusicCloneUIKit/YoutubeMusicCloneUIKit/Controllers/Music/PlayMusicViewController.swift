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
    
    private var bottomBorder: UIView {
        let bottomBorder = UIView(frame: CGRect(x: 0, y: view.height - 4, width: view.width, height: 1))
        bottomBorder.backgroundColor = .gray.withAlphaComponent(0.29)
        return bottomBorder
    }
    
    private let musicBackgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        //iv.image = UIImage(named: "youtube-music-app-clone-logo")
        iv.layer.opacity = 0
        iv.setHeight(2229)
        return iv
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Helpers
    
    func setupUI(){
        view.frame = CGRect(x: 0, y: self.view.height - (foldedViewHeight + 82), width: self.view.width, height: foldedViewHeight)
        
        view.addSubview(bottomBorder)
        view.addSubview(musicBackgroundImageView)
        musicBackgroundImageView.setWidth(2229)
        musicBackgroundImageView.centerY(inView: view)
        musicBackgroundImageView.centerX(inView: view)
        view.clipsToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapPlayView))
        view.addGestureRecognizer(tap)
        
        view.backgroundColor = UIColor.theme.tabBarBackgroundColor ?? .gray
        
        NotificationCenter.default.addObserver(self, selector: #selector(showMusicDetailScreen(_:)), name: NSNotification.Name(PLAY_MUSIC_VIEW_NOTIFICATION_NAME), object: viewModel)
        
        
    }
    
    //MARK: - Notification
    @objc func showMusicDetailScreen(_ notification: Notification) {
        musicBackgroundImageView.image = nil
        if let viewModel = notification.object as? MusicViewModel {
            viewModel.downloadImage {[weak self] image in
                self?.musicBackgroundImageView.image = image.blur(7)
            }
            didTapPlayView()
        }
        
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
            }) {_ in
                UIView.animate(withDuration: 0.7) {
                    bottomMusicPlayView.frame = CGRect(x: 0, y: 0, width: self.view.width, height: self.expandedViewHeight)
                    
                    self.musicBackgroundImageView.layer.opacity = 0.29
                }
            }
        }else {
            UIView.animate(withDuration: 0.01, animations: {
                bottomMusicPlayView.frame =  CGRect(x: 0, y: 0, width: self.view.width, height: self.expandedViewHeight + 200)
            }) {_ in
                UIView.animate(withDuration: 0.7) {
                    bottomMusicPlayView.frame =  CGRect(x: 0, y: self.expandedViewHeight - (self.foldedViewHeight + 82), width: self.view.width, height: self.foldedViewHeight)
                    self.musicBackgroundImageView.layer.opacity = 0
                }
            }
        }
        
    }
}
