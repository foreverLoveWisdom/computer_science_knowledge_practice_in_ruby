# This is a violation of Open Closed Principle
# Since we need to modify the Logger class every time we add
#   a new sender or receiver
class Logger
  def initialize(format, delivery)
    @format = format
    @delivery = delivery
  end

  def log(string)
    deliver format(string)
  end

  private

  def format(string)
    case @format
    when :raw
      string
    when :with_date
      "#{Time.now} #{string}"
    when :with_date_and_details
      "Log was creates at #{Time.now}, please check details #{string}"
    else
      raise NotImplementedError
    end
  end

  def deliver(text)
    case @delivery
    when :by_email
      Mailer.deliver(
        from: "asdfasdf",
        to: "admin@gmail.com",
        subject: "logger",
        body: text,
      )
    when :by_sms
      client = Twilio::REST::Client.new("ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "your_auth_token")
      client.account.messages.create(
        from: "+15017250604",
        to: "+15558675309",
        body: text,
      )
    when :to_stdout
      STDOUT.write(text)
    else
      raise NotImplementedError
    end
  end
end

logger = Logger.new(:raw, :sms)
logger.log("Emergency error! Please fix me!")

# This version is refactored so that the class is not modified whenever
# adding a new sender or receiver
# Additionally, the code will be able to be extended
class Logger
  def initialize(formatter: DateDetailsFormatter.new, sender: LogWriter.new)
    @formatter = formatter
    @sender = sender
  end

  def log(string)
    @sender.deliver @formatter.format(string)
  end
end

class DateDetailsFormatter
  def format(string)
    "Log was created at #{Time.now}, please check details #{string}"
  end
end

class RawFormatter
  def format(string)
    string
  end
end

class DateFormatter
  def formatter(string)
    "#{Time.now} #{string}"
  end
end

class LogWriter
  def deliver(log)
    STDOUT.write(text)
  end
end

class LogSms
  def initialize
    @account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    @auth_token = "your_auth_token"
    @from = "+15017250604"
    @to = "+15558675309"
  end

  def deliver(text)
    client.account.message.create(from: @from, to: @to, body: @text)
  end

  private

  def client
    @client ||= Twilio::REST::Client.new(@account_sid, @auth_token)
  end
end

class LogMailer
  def initialize
    @from = "emergency@example.com"
    @to = "admin@example.com"
    @sublect = "Logger report"
  end

  def deliver(text)
    Mailer.deliver(
      from: @from,
      to: @to,
      subject: @sublect,
      body: text,
    )
  end
end

log = Logger.new(formatter: RawFormatter.new, sender: LogSms.new)
logger.log('Emergency error! Please fix me')
