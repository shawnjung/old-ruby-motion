class Animations
  def self.method_missing(method, *args, &block)
    new.send method, *args, &block
  end

  def pop_up(view, &callback)
    puts callback.inspect
    animation_method callback do
      view.alpha = 1
      view.transform = CGAffineTransformMakeScale(1, 1)
    end
  end

  def pop_down(view, &callback)
    puts callback.inspect
    animation_method callback do
      view.alpha = 0
      view.transform = CGAffineTransformMakeScale(0.1, 0.1)
    end
  end

  def animation_method(callback, &animations)
    UIView.animateWithDuration(1.0, animations: animations, completion: callback)

  end
end