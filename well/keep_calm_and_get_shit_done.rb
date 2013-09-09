class KeepCalmAndGetShitDone
  def initialize
    @index   = 0
    @answers = loadTexts
  end

  def loadTexts
    textFile = NSBundle.mainBundle.pathForResource('texts', ofType: 'json')
    errorPointer = Pointer.new(:object)
    data = NSData.alloc.initWithContentsOfFile(textFile, options: NSDataReadingUncached, error: errorPointer)
    unless data
      printError errorPointer[0]
      return defaultAnswers
    end

    json = NSJSONSerialization.JSONObjectWithData(data, options: NSDataReadingUncached, error: errorPointer)

    unless json
      printError errorPointer[0]
      return defaultAnswers
    end

    json["texts"]
  end

  def printError(error)
    $stderr.puts "Error: #{error.description}"
  end

  def nextText
    next_text = @answers[@index]
    @index = @index + 1
    @index = 0 if @answers.length <= @index
    next_text
  end

  def defaultAnswers
    "I Cannot Load The File.".split
  end
end