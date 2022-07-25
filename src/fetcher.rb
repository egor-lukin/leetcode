require 'ferrum'

class Fetcher
  class << self
    def call url
      # FIXME move url to env var
      browser = Ferrum::Browser.new(url: 'http://192.168.64.2:9222')
                                    # timeout: 20)
                                    # timeout: 240)
      browser.go_to(url)
      browser.network.wait_for_idle(timeout: 60)

      browser.at_xpath("//*[select]").select(["Ruby"])

      # browser.at_xpath("//a[text() = 'No UI changes button']").click
      # browser.screenshot(path: "test.png")
      # browser.pdf(path: "test.pdf")

      body = browser.body
      browser.reset
      browser.quit

      body
    end
  end
end
