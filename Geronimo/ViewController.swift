//
//  ViewController.swift
//  Geronimo
//
//  Created by Alex Rabin on 8/13/16.
//  Copyright © 2016 Alex Rabin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var xUnit = UIScreen.main.bounds.width/20
    var yUnit = UIScreen.main.bounds.height/30
let font = "Aldo The Apache"
    var pictures = UIButton()
    var birth = UIButton()
    var death = UIButton()
    var impact = UIButton()
    var family = UIButton()
 var popUp = UIScrollView()
    var imageView = UIImageView()

    var titleImage = UIImageView()
    var blurView = UIView()
var titleString = UILabel()
var blur = UIView()
    var nameLabel = UILabel()
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        let safeAreaInsets = self.view.safeAreaInsets
        let frame =  CGRectMake(safeAreaInsets.left, safeAreaInsets.top, self.view.frame.width - safeAreaInsets.left, self.view.frame.size.height - safeAreaInsets.top)
        
        titleImage = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        titleImage.image = UIImage(named: "imgres.jpg")
        self.view.addSubview(titleImage)
        
        blurView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        blurView.backgroundColor = UIColor.black
        blurView.alpha = 0.6
        self.view.addSubview(blurView)
        
        titleString = UILabel(frame: CGRect(x: frame.minX, y: (-0.1 * yUnit) + safeAreaInsets.top, width: self.view.frame.size.width, height: 3*yUnit))
        titleString.font = UIFont(name: font, size: 60)
        titleString.text = "Geronimo"
        titleString.textColor = UIColor.white
        titleString.textAlignment = .center
               self.view.addSubview(titleString)
        
        nameLabel = UILabel(frame: CGRect(x: 0, y:  (2*yUnit) + safeAreaInsets.top, width: self.view.frame.size.width, height: 3*yUnit))
        nameLabel.font = UIFont(name: font, size: 18)
        nameLabel.numberOfLines = 3
        nameLabel.text = "Alex Rabin\nMr. Fredricks\nPeriod 2"
        nameLabel.textColor = UIColor.white
        nameLabel.textAlignment = .center
        self.view.addSubview(nameLabel)
        
       
        
        birth = UIButton(frame: CGRect(x: 6*xUnit, y: (14*yUnit) + safeAreaInsets.top, width: 9*xUnit, height: 2*yUnit))
        birth.setTitle("Birth/Death", for: .normal)
        birth.titleLabel?.font = UIFont(name: font, size: 30)
        birth.addTarget(self, action: #selector(birthAction), for: .touchUpInside)
        birth.setTitleColor(UIColor.white, for: .normal)
        birth.layer.borderColor = UIColor.white.cgColor
        birth.layer.cornerRadius = xUnit
        birth.layer.borderWidth = 1.5

        self.view.addSubview(birth)
        
        pictures = UIButton(frame: CGRect(x: 5*xUnit, y: (25*yUnit) + safeAreaInsets.top, width: 11*xUnit, height: 2*yUnit))
        pictures.setTitle("Photo Gallery", for: .normal)
        pictures.titleLabel?.font = UIFont(name: font, size: 30)
        pictures.addTarget(self, action: #selector(photoGallery), for: .touchUpInside)
        pictures.setTitleColor(UIColor.white, for: .normal)
        pictures.layer.borderColor = UIColor.white.cgColor
        pictures.layer.cornerRadius = xUnit
        pictures.layer.borderWidth = 1.5
        
        self.view.addSubview(pictures)


        self.view.addSubview(death)
        
        family = UIButton(frame: CGRect(x: 7*xUnit, y: (17*yUnit) + safeAreaInsets.top, width: 7*xUnit, height: 2*yUnit))
        family.setTitle("Family", for: .normal)
        family.titleLabel?.font = UIFont(name: font, size: 30)
        family.setTitleColor(UIColor.white, for: .normal)
        family.layer.borderColor = UIColor.white.cgColor
        family.layer.borderWidth = 1.5
        family.addTarget(self, action: #selector(familyAction), for: .touchUpInside)
        family.layer.cornerRadius = xUnit

        self.view.addSubview(family)
        
        
        impact = UIButton(frame: CGRect(x: 0, y: (20*yUnit) + safeAreaInsets.top, width: self.view.frame.size.width, height: 3.5*yUnit))
        impact.setTitle("What was his impact on Arizona History?", for: .normal)
        impact.titleLabel?.font = UIFont(name: font, size: 40)
        impact.titleLabel?.numberOfLines = 2
        impact.titleLabel?.textAlignment = .center
        impact.setTitleColor(UIColor.white, for: .normal)
        impact.layer.borderColor = UIColor.white.cgColor
        impact.layer.cornerRadius = xUnit
        impact.addTarget(self, action: #selector(impactAction), for: .touchUpInside)
        impact.layer.borderWidth = 1.5

        self.view.addSubview(impact)

    }

    @objc func photoGallery(){
        let safeAreaInsets = self.view.safeAreaInsets

        blur = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        blur.backgroundColor = UIColor.black
        self.view.addSubview(blur)
        fadeInView(alpha: 0.7, duration: 1.0, view: blur)
        
        popUp = UIScrollView(frame: CGRect(x: xUnit, y: (yUnit) + safeAreaInsets.top, width: 18*xUnit, height: 30*xUnit))
        popUp.backgroundColor = UIColor.white
        popUp.isOpaque = true
        popUp.alpha  = 1
        popUp.layer.cornerRadius = 40
        self.view.addSubview(popUp)
        
        let title = UILabel(frame: CGRect(x: 0, y: (yUnit), width: popUp.frame.size.width, height: popUp.frame.size.height/18))
        title.text = "Photo Gallery"
        title.textAlignment = .center
        title.textColor = UIColor.black
        title.font = UIFont(name: font, size: 45)
        popUp.addSubview(title)

        let photos = ["imgres.jpg", "imgres-1.jpg", "image.jpg", "imgres-2.jpg", "images-1.jpg", "images.jpg", "imgres-3.jpg", "imgres-4.jpg"]
        var y = 2*yUnit + (popUp.frame.size.height/18)
        for i in 0...photos.count-1{
          let image = UIImageView(frame:  CGRect(x: xUnit, y: y, width: popUp.frame.size.width-(2*xUnit), height: 10*yUnit))
            image.image = UIImage(named: photos[i])
            image.isUserInteractionEnabled = true
            popUp.addSubview(image)
            y += yUnit*11
            
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(tappedOnPicture(gesture:)))
            image.addGestureRecognizer(recognizer)

        }
        y+=yUnit
        popUp.contentSize = CGSizeMake(popUp.frame.size.width, y)

    }
    @objc func tappedOnPicture(gesture:UITapGestureRecognizer){
        let tappedView = gesture.view?.hitTest(gesture.location(in: gesture.view), with: nil)
        let tappedImage = tappedView as! UIImageView
        showImage(image: tappedImage.image!)
        
    }
    @objc func birthAction(){
        blur = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        blur.backgroundColor = UIColor.black
        self.view.addSubview(blur)
        fadeInView(alpha: 0.7, duration: 1.0, view: blur)
      
        popUp = UIScrollView(frame: CGRect(x: xUnit, y: (yUnit + self.view.safeAreaInsets.top), width: 18*xUnit, height: 30*xUnit))
        popUp.backgroundColor = UIColor.white
        popUp.isOpaque = true
        popUp.alpha  = 0.9
        popUp.layer.cornerRadius = 40
        popUp.contentSize = CGSizeMake(popUp.frame.size.width, popUp.frame.size.height*1.5)
        self.view.addSubview(popUp)
        
        let title = UILabel(frame: CGRect(x: 0, y: (yUnit ), width: popUp.frame.size.width, height: popUp.frame.size.height/18))
        title.text = "Birth/Death"
        title.textAlignment = .center
        title.textColor = UIColor.black
        title.font = UIFont(name: font, size: 45)
        popUp.addSubview(title)
        
        imageView = UIImageView(frame:  CGRect(x: xUnit, y: (3*yUnit), width: popUp.frame.size.width-(2*xUnit), height: 10*yUnit))
        imageView.image = UIImage(named: "imgres-1.jpg")
        imageView.isUserInteractionEnabled = true
        popUp.addSubview(imageView)
        
        
        let textView = UILabel(frame: CGRect(x: xUnit, y:( 12*yUnit), width: popUp.frame.size.width-(2*xUnit), height: popUp.frame.size.height))
        textView.text = "Geronimo was born on June 16, 1829. His birth name was Goyakla which means to yawn. Geronimo was born to the Bedonkohe band of the Apache\n\nIn February 1909, Geronimo was thrown from his horse while riding home, and had to lie in the cold all night before a friend found him extremely ill. He died of pneumonia on February 17, 1909, as a prisoner of the United States at Fort Sill, Oklahoma."
        textView.numberOfLines = 0
        textView.textColor = UIColor.black
        textView.font = UIFont(name: font, size: 30)
        popUp.addSubview(textView)
        
        
        popUp.transform = CGAffineTransformMakeScale(1.3, 1.3)
        popUp.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.popUp.alpha = 1.0
            self.popUp.transform = CGAffineTransformMakeScale(1.0, 1.0)
        });
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(imageTouch))
        imageView.addGestureRecognizer(recognizer)

    }
    @objc func familyAction(){
        blur = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        blur.backgroundColor = UIColor.black
        self.view.addSubview(blur)
        fadeInView(alpha: 0.7, duration: 1.0, view: blur)
       
        popUp = UIScrollView(frame: CGRect(x: xUnit, y: (yUnit + self.view.safeAreaInsets.top), width: 18*xUnit, height: 30*xUnit))
        popUp.backgroundColor = UIColor.white
        popUp.isOpaque = true
        popUp.alpha  = 0.9
        popUp.layer.cornerRadius = 40
        popUp.contentSize = CGSizeMake(popUp.frame.size.width, popUp.frame.size.height*1.1)
        self.view.addSubview(popUp)
        
        let title = UILabel(frame: CGRect(x: 0, y: (yUnit), width: popUp.frame.size.width, height: popUp.frame.size.height/18))
        title.text = "Family"
        title.textAlignment = .center
        title.font = UIFont(name: font, size: 45)
        title.textColor = UIColor.black
        popUp.addSubview(title)
        
        imageView = UIImageView(frame:  CGRect(x: xUnit, y: (3*yUnit), width: popUp.frame.size.width-(2*xUnit), height: 8*yUnit))
        imageView.image = UIImage(named: "imgres-2.jpg")
        imageView.isUserInteractionEnabled = true
        popUp.addSubview(imageView)
        
        
        let textView = UILabel(frame: CGRect(x: xUnit, y: (8*yUnit) , width: popUp.frame.size.width-(2*xUnit), height: popUp.frame.size.height - (3*yUnit)))
        textView.text = "His grandfather, Mahko, was an Apache chief. Geronimo's father was Taklishim, and his mother was Juana. Taklishim took a serious illness and died while Geronimo was a teenager, but he stepped up and became the head of his mother's home."
        textView.numberOfLines = 0
        textView.textColor = UIColor.black
        textView.font = UIFont(name: font, size: 30)
        popUp.addSubview(textView)
        
        
        popUp.transform = CGAffineTransformMakeScale(1.3, 1.3)
        popUp.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.popUp.alpha = 1.0
            self.popUp.transform = CGAffineTransformMakeScale(1.0, 1.0)
        });
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(imageTouch))
        imageView.addGestureRecognizer(recognizer)


    }
    func deathAction(){
        blur = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        blur.backgroundColor = UIColor.black
        self.view.addSubview(blur)
        fadeInView(alpha: 0.7, duration: 1.0, view: blur)
        popUpView(titleString: "Death", info: "",image: UIImage(named: "imgres-2.jpg")!)
        
    }
    
    @objc func impactAction(){
            
        blur = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        blur.backgroundColor = UIColor.black
        self.view.addSubview(blur)
        fadeInView(alpha: 0.7, duration: 1.0, view: blur)
            
            popUp = UIScrollView(frame: CGRect(x: xUnit, y: (yUnit + self.view.safeAreaInsets.top), width: 18*xUnit, height: 32*xUnit))
            popUp.backgroundColor = UIColor.white
            popUp.isOpaque = true
            popUp.alpha  = 0.9
            popUp.layer.cornerRadius = 40
            popUp.contentSize = CGSizeMake(popUp.frame.size.width, popUp.frame.size.height*1.4)
            self.view.addSubview(popUp)
            
            let title = UILabel(frame: CGRect(x: 0, y: (yUnit), width: popUp.frame.size.width, height: popUp.frame.size.height/18))
            title.text = "Impact"
            title.textAlignment = .center
        title.textColor = UIColor.black
            title.font = UIFont(name: font, size: 45)
            popUp.addSubview(title)
            
            imageView = UIImageView(frame:  CGRect(x: xUnit, y: (3*yUnit), width: popUp.frame.size.width-(2*xUnit), height: 8*yUnit))
            imageView.image = UIImage(named: "imgres-3.jpg")
            imageView.isUserInteractionEnabled = true
            popUp.addSubview(imageView)
            
            
            let textView = UILabel(frame: CGRect(x: xUnit, y: (11*yUnit), width: popUp.frame.size.width-(2*xUnit), height: popUp.frame.size.height))
            textView.text = "Geronimo was known for being a leader throughout the Apache tribe. He would conduct raids upon Mexicans who had killed his mother, wife, and three children. After being on reservation land for many years, an Apache leader was shot for resisiting arrest. Afraid of be arrested, Geronimo left the Reservation heading to Mexico with many followers as well.  For the next couple years, his group would capture American Territory."
            textView.numberOfLines = 0
            textView.textColor = UIColor.black
            textView.font = UIFont(name: font, size: 30)
            popUp.addSubview(textView)
            
            
            popUp.transform = CGAffineTransformMakeScale(1.3, 1.3)
            popUp.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
                self.popUp.alpha = 1.0
                self.popUp.transform = CGAffineTransformMakeScale(1.0, 1.0)
            });
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(imageTouch))
            imageView.addGestureRecognizer(recognizer)
            
            

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
         get {
             return true
         }
     }
    
    var bacview = UIScrollView()
     var imagedShown = UIImageView()
    
    func showImage(image: UIImage){
        bacview = UIScrollView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height))

        bacview.backgroundColor = UIColor.black
        bacview.delegate = self
        bacview.maximumZoomScale = 3.0
        bacview.minimumZoomScale = 1.0
        bacview.contentSize = CGSize(width: 0, height: self.view.frame.size.height)
        bacview.isScrollEnabled = true
        bacview.isUserInteractionEnabled = true
        self.view.addSubview(bacview)
        
        imagedShown = UIImageView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height))
        imagedShown.image = image
        imagedShown.contentMode = .scaleAspectFit
        bacview.addSubview(imagedShown)
        let downswipe = UISwipeGestureRecognizer(target: self, action: #selector(down))
        downswipe.direction = .down
        bacview.addGestureRecognizer(downswipe)
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imagedShown
    }
    @objc func down(){
        UIView.animate(withDuration: 0.3, animations: {
            self.bacview.center.y += self.view.bounds.height
            
            }, completion: { finish in
                self.bacview.removeFromSuperview()
        })
    }
    func fadeInView(alpha: CGFloat, duration: TimeInterval, view: UIView){
        view.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            view.alpha = alpha
            
            }, completion: { finish in
                
        })
        
    }
    func fadeOut(alpha: CGFloat, duration: TimeInterval, view: UIView){
        UIView.animate(withDuration: duration, animations: {
            view.alpha = alpha
            self.blur.alpha = alpha
            }, completion: { finish in
                view.removeFromSuperview()
                self.blur.removeFromSuperview()
        })
        
    }
       func popUpView(titleString: String, info: String, image: UIImage){
        popUp = UIScrollView(frame: CGRect(x: xUnit, y: yUnit, width: 18*xUnit, height: 30*xUnit))
        popUp.backgroundColor = UIColor.white
        popUp.isOpaque = true
        popUp.alpha  = 0.9
        popUp.layer.cornerRadius = 40
        popUp.contentSize = CGSize(width: popUp.frame.size.width, height: popUp.frame.size.height*1.5)
        self.view.addSubview(popUp)
        
        let title = UILabel(frame: CGRect(x: 0, y: yUnit, width: popUp.frame.size.width, height: popUp.frame.size.height/18))
        title.text = titleString
        title.textAlignment = .center
        title.font = UIFont(name: font, size: 45)
        popUp.addSubview(title)
        
         imageView = UIImageView(frame:  CGRect(x: xUnit, y: 3*yUnit, width: popUp.frame.size.width-(2*xUnit), height: 8*yUnit))
        imageView.image = image
        imageView.isUserInteractionEnabled = true
        popUp.addSubview(imageView)

        
        let textView = UILabel(frame: CGRect(x: xUnit, y: imageView.frame.size.height + 2*yUnit, width: popUp.frame.size.width-(2*xUnit), height: popUp.frame.size.height - (3*yUnit)))
        textView.text = info
        textView.numberOfLines = 0
        textView.textColor = UIColor.black
        textView.font = UIFont(name: font, size: 30)
        popUp.addSubview(textView)
        
        
        popUp.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            popUp.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
                self.popUp.alpha = 1.0
            self.popUp.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            });
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(imageTouch))
        imageView.addGestureRecognizer(recognizer)
    }
    @objc func imageTouch(){
        showImage(image: imageView.image!)
    }
    func removeAnimate()
    {
        
        UIView.animate(withDuration: 0.25, animations: {
            self.popUp.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
           self.popUp.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                self.popUp.removeFromSuperview()
                    self.fadeOut(alpha: 0.0, duration: 0.25, view: self.blur)
                    
                }
        });
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        removeAnimate()

    }
}

