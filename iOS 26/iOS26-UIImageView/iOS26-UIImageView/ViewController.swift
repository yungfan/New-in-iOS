import UIKit

class ViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .thin, scale: .large)
        let image = UIImage(systemName: "26.square", withConfiguration: symbolConfig)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.contentMode = .scaleAspectFit
        imageView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - 150)
        return imageView
    }()

    lazy var imageView2: UIImageView = {
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .thin, scale: .large)
        let image = UIImage(systemName: "26.square", withConfiguration: symbolConfig)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.contentMode = .scaleAspectFit
        imageView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        return imageView
    }()

    lazy var imageView3: UIImageView = {
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .thin, scale: .large)
        let image = UIImage(systemName: "26.square", withConfiguration: symbolConfig)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.contentMode = .scaleAspectFit
        imageView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY + 150)
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
        view.addSubview(imageView2)
        view.addSubview(imageView3)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // iOS26新增，drawOff效果
        imageView.addSymbolEffect(.drawOff.byLayer, options: .speed(0.01), animated: true) { _ in
            // iOS26新增，drawOn效果
            self.imageView.addSymbolEffect(.drawOn.byLayer, options: .speed(0.01))
        }

        imageView2.addSymbolEffect(.drawOff.wholeSymbol, options: .speed(0.01), animated: true) { _ in
            self.imageView2.addSymbolEffect(.drawOn.wholeSymbol, options: .speed(0.01))
        }

        imageView3.addSymbolEffect(.drawOff.individually, options: .speed(0.01), animated: true) { _ in
            self.imageView3.addSymbolEffect(.drawOn.individually, options: .speed(0.01))
        }
    }
}
