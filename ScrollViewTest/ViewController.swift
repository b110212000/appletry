//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by BC_Office on 2021/4/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "test.jpg")
        
        let size = imageView.image!.size
        scrollView.contentSize = size
        
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 5
        scrollView.zoomScale = 0.5
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        moveToCenter()
        return imageView
    }

    func moveToCenter(){
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.frame.size
        var wPadding: CGFloat = 0
        var hPadding: CGFloat = 0

        if imageViewSize.width < scrollViewSize.width {
            wPadding = (scrollViewSize.width - imageViewSize.width) / 5
        }

        if imageViewSize.height < scrollViewSize.height {
            hPadding = (scrollViewSize.height - imageViewSize.height) / 5
        }

        scrollView.contentInset = UIEdgeInsets(top: hPadding, left: wPadding, bottom: hPadding, right: wPadding)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moveToCenter()
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        moveToCenter()
    }
    
}

