//
//  ViewController.swift
//  YotubeWebView
//
//  Created by IJ . on 2020/04/22.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
  
    var videos : [Video] = []
    
    @IBOutlet weak var videoWebView: UIWebView!
    @IBOutlet weak var loadRequestButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let video1 = Video()
//        video1.Key = "Cm84D_sFxHs"
//        video1.Title = "머리 싸매고.. 부부의세계 3,4,5,6화 리뷰 [박막례 할머니]"
//        videos.append(video1)
//
//        let video2 = Video()
//        video2.Key = "aGXq_CkBvOw"
//        video2.Title = "드디어.. 부부의 세계 정주행 시작.. [박막례 할머니]"
//        videos.append(video2)
        
        let video3 = Video()
        video3.Key = "5EdieXc3rnQ"
        video3.Title = "국물이 끝내주는 국물떡볶이 레시피 [박막례 할머니]"
        videos.append(video3)
    }
    func getVideo(videoKey:String){
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoKey)") else { return  }
        videoWebView.loadRequest(URLRequest(url: url))
        
    }
    
    @IBAction func touchUpLoadRequest(_ sender: Any) {
        getVideo(videoKey: videos[0].Key)
    }
}

extension ViewController {
    
    class Video {
          var Key:String = ""
          var Title: String = ""
      }
}
