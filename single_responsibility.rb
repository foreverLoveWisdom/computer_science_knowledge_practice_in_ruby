# Any complicated classes should be broken down into small classes
# Each of a small class will be responsible for a particular behaviour

# How about take a look at a violation of this priciple
# what does this class do?
#   1. Report generation
#   2. Report sending
class FinancialReportMailer
  def initialize(report, account)
    @account = account
    @report = report
  end

  def deliver
    Mailer.deliver(
      from: "abc@report.com",
      to: @account.email,
      subject: "ahihi..",
      body: @report,
    )
  end
end

mailer = FinancialReportMailer.new(transactions, account)
mailer.generate_report!
mailer.deliver

class FinancialReportGenerator
  def initialize(transactions)
    @transactions = transactions
  end

  def generate_report!
    @report = @transactions.map {
      |t|
      "amount: #{t.amount} type: #{t.type} date: #{t.created_at}"
    }.join("\n")
  end
end

report = FinancialReportGenerator.new(transactions).generate
FinancialReportMailer.new(account, report).deliver
