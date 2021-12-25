//
//  ScoreViewController.swift
//  SampleQuiz
//
//  Created by Yuko Terao on 2021/04/29.
//

import UIKit
import GoogleMobileAds

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    var correct = 0
    var numOfQuestions = 0
    var bannerView:GADBannerView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(numOfQuestions)問中\(correct)問正解！"

        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-9662556047226284/1230362948"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
        
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
        let text1 = "#\(numOfQuestions)問中\(correct)問正解しました。"
        let text2 = "#ランニング食学検定"
        let appLogo = UIImage(named: "Image")

        let item = [text1, text2, appLogo as Any]
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        
        let excludedActivityTypes: Array<UIActivity.ActivityType> = [
                    // UIActivityType.addToReadingList,
                    // UIActivityType.airDrop,
                    // UIActivityType.assignToContact,
                    // UIActivityType.copyToPasteboard,
                    // UIActivityType.mail,
                    // UIActivityType.message,
                    // UIActivityType.openInIBooks,
                    // UIActivityType.postToFacebook,
            //UIActivity.ActivityType.postToFlickr,
            //UIActivity.ActivityType.postToTencentWeibo
                    // UIActivityType.postToTwitter,
                    // UIActivityType.postToVimeo,
                    // UIActivityType.postToWeibo,
                    // UIActivityType.print,
            UIActivity.ActivityType.saveToCameraRoll,
                    // UIActivityType.markupAsPDF
                ]
                activityVC.excludedActivityTypes = excludedActivityTypes

        
        activityVC.popoverPresentationController?.sourceView = self.scoreLabel
        
        self.present(activityVC, animated: true, completion: nil)
        
    }

    
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: view.safeAreaLayoutGuide,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    

}
