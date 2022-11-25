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
        button.frame = CGRect(x: view.width - (29 + 35), y: 100 + view.width, width: 35, height: 35)
        button.addTarget(self, action: #selector(didTapLike(_ :)), for: .touchUpInside)
        button.layer.opacity = 0
        return button
    }()
    
    private lazy var unlikeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        button.frame = CGRect(x: 29, y: 100 + view.width, width: 35, height: 35)
        button.addTarget(self, action: #selector(didTapLike(_ :)), for: .touchUpInside)
        button.layer.opacity = 0
        return button
    }()
    
    private lazy var durationSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 0
        slider.maximumValue = 0
        slider.frame = CGRect(x: 0, y: view.height - 1, width: view.width, height: 1)
        slider.setThumbImage(UIImage(systemName: "circle.fill"), for: .normal)
        slider.tintColor = .tintColor
        slider.thumbTintColor = .white
        slider.addTarget(self, action: #selector(onChangeSlider(_ :)), for: .valueChanged)
        return slider
    }()
    
    private lazy var sliderCurrentValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "00:00"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.frame = CGRect(x: 31, y: 197 + view.width, width: 60, height: 35)
        label.textAlignment = .left
        label.layer.opacity = 0
        return label
    }()
    
    private lazy var sliderMaximumValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "01:00"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.frame = CGRect(x: view.width - (31 + 60), y: 197 + view.width, width: 60, height: 35)
        label.textAlignment = .right
        label.layer.opacity = 0
        return label
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.backgroundColor = UIColor.gray.withAlphaComponent(0.29)
        button.layer.cornerRadius = 42
        button.addTarget(self, action: #selector(didTapPlayStack(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var playStackView: UIStackView = {
        let buttonShuffle = UIButton(type: .system)
        buttonShuffle.setImage(UIImage(systemName: "shuffle"), for: .normal)
        buttonShuffle.tintColor = .white
        let buttonBack = UIButton(type: .system)
        buttonBack.setImage(UIImage(systemName: "backward.end.fill"), for: .normal)
        buttonBack.tintColor = .white
        let buttonNext = UIButton(type: .system)
        buttonNext.setImage(UIImage(systemName: "forward.end.fill"), for: .normal)
        buttonNext.tintColor = .white
        let buttonRepeat = UIButton(type: .system)
        buttonRepeat.setImage(UIImage(systemName: "repeat"), for: .normal)
        buttonRepeat.tintColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [
            buttonShuffle, buttonBack,
            playButton,
            buttonNext, buttonRepeat
            ])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.frame = CGRect(x: 0, y: 239 + view.width, width: view.width, height: 85)

        return stackView
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Notification
    @objc func showMusicDetailScreen(_ notification: Notification) {
        if let viewModel = notification.object as? MusicViewModel {
            self.viewModel = viewModel
            
            view.layer.opacity = 1
            viewModel.downloadImage {[weak self] image in
                
                self?.musicBackgroundImageView.image = image
                self?.musicImageView.image = image
                
                self?.titleLabel.text = viewModel.title
                self?.artistButton.text = viewModel.artist
                
                self?.durationSlider.maximumValue = Float(viewModel.music.durationInSeconds)
                self?.sliderMaximumValueLabel.text = "0\(viewModel.minute)"
                self?.sliderCurrentValueLabel.text = "00:00"
                self?.durationSlider.value = 0.0
                
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
        view.addSubview(sliderCurrentValueLabel)
        view.addSubview(sliderMaximumValueLabel)
        
        view.addSubview(playStackView)
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
        
        
        sliderCurrentValueLabel.layer.opacity = 0
        sliderMaximumValueLabel.layer.opacity = 0
    }
    func foldingAnimationSlow(){
        musicImageView.frame = CGRect(x: 29, y: 14, width: 48, height: 48)
        
        durationSlider.frame = CGRect(x: 0, y: foldedViewHeight - 1, width: view.width, height: 1)
        durationSlider.thumbTintColor = .white.withAlphaComponent(0)
        durationSlider.tintColor = .white
    }
    func expandingAnimationQuick(){
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
        
        durationSlider.frame = CGRect(x: 29, y: 177 + view.width, width: view.width - 58, height: 35)
        durationSlider.thumbTintColor = .white
        durationSlider.tintColor = .white
        durationSlider.setThumbImage(UIImage(systemName: "circle.fill"), for: .normal)
        
        sliderCurrentValueLabel.layer.opacity = 1
        sliderMaximumValueLabel.layer.opacity = 1
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
        if playAndReflectButton.image(for: .normal) != UIImage(systemName: "dot.radiowaves.up.forward"){
            didTapPlayStack(playAndReflectButton)
        }
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
    
    @objc func onChangeSlider(_ sender: UISlider){
        let currentSecond: Int = Int(sender.value)
        var secondValue = ""
        
        if currentSecond < 10 { secondValue = "00:0\(currentSecond)"}
        else if currentSecond < 60 { secondValue = "00:\(currentSecond)"}
        else {secondValue = "0\(Double(sender.value).asStringInMinute(style: .positional))"}
        
        sliderCurrentValueLabel.text = secondValue
        
        if playAndReflectButton.image(for: .normal) != UIImage(systemName: "dot.radiowaves.up.forward") {
            playAndReflectButton.setImage(playButton.image(for: .normal), for: .normal)
        }
    }
    
    @objc func didTapPlayStack(_ sender: UIButton){
       
        guard let viewModel = self.viewModel else {return}
        let durationInSeconds = Float(viewModel.music.durationInSeconds)
       
        if sender.image(for: .normal) == UIImage(systemName: "play.fill") {
            sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if sender.image(for: .normal) == UIImage(systemName: "pause.fill") &&
                    self.durationSlider.value < durationInSeconds {
                    self.durationSlider.setValue(self.durationSlider.value + 1, animated:true)
                    self.onChangeSlider(self.durationSlider)
                }
                else {
                    timer.invalidate()
                }
            }
            
        }else {
            sender.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
}
