//
//  ViewController.swift
//  PageScroll
//
//  Created by Ronit Rudra on 7/22/17.
//  Copyright © 2017 Ronit Rudra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    // Declare an empty array of type UIImageView
    var images = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        
        // Loop through the 3 icon images
        for x in 0...2{
            // Inititalize a constant with image of icon
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            // append read image to array
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            // Offset images to outside of screen, right at the center
            // x is typecasted as newX is a CGFloat
            // new math based on changed scrollview, not the superview
            newX = scrollView.frame.size.width/2 + scrollView.frame.size.width * CGFloat(x)
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX-75,y: (scrollView.frame.size.height/2)-75,width: 150, height: 150)
        }
        
        // Display size of image array in console
        print("Count: \(images.count)")
        
        //scrollView.backgroundColor = UIColor.purple
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth,height: view.frame.size.height)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

