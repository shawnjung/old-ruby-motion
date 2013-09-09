class NoraeViewController < UIViewController
  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    view.image = UIImage.imageNamed 'background.png'

    @keepCalmText = KeepCalmAndGetShitDone.new
    @label = makeLabel
    view.addSubview @label

    view.userInteractionEnabled = true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action: 'showAnswer')
    @label.addGestureRecognizer(recognizer)
  end

  def showAnswer
    Animations.pop_down @label do |finished|
      @label.text = @keepCalmText.nextText
      Animations.pop_up @label do |finished|
      end
    end
  end

  def makeLabel
    label = UILabel.alloc.initWithFrame [[10,60], [300,80]]
    label.text            = @keepCalmText.nextText
    label.backgroundColor = UIColor.redColor
    label.textColor       = UIColor.whiteColor
    label.font            = UIFont.boldSystemFontOfSize 34
    label.textAlignment   = UITextAlignmentCenter
    label.userInteractionEnabled = true
    label
  end
end