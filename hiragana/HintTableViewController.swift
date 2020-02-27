//
//  HintTableViewController.swift
//  hiragana
//
//  Created by Admin on 2/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class HintTableViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var hintTableImage: UIImageView!

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 4.0
        hintTableImage.image = UIImage(named: "hiragana.jpg")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.hintTableImage
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
