# Template — CI fills 0.0.3 / 855e99787d0bdb3db93f8d2cbaf31d5f99a7768f688f187a400342e8c503cd30 and commits the result to the
# public homebrew-tap repo. The zip is hosted on the tap's own releases.
cask "eli" do
  version "0.0.3"
  sha256 "855e99787d0bdb3db93f8d2cbaf31d5f99a7768f688f187a400342e8c503cd30"

  url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v#{version}/Eli-v#{version}-macos.zip"
  name "Eli"
  desc "Menu bar presence app for Eli"
  homepage "https://github.com/Qu1etboy/homebrew-tap"

  depends_on macos: :ventura

  app "Eli.app"

  zap trash: [
    "~/.eli",
    "~/Library/LaunchAgents/co.fastwork.eli.plist",
  ]
end
