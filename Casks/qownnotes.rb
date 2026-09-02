cask "qownnotes" do
  version "26.9.6"
  sha256 "2fe30b0aa2ddd7652204ad265f79e370b1cb7d9bd93e0c66b41e41b391ecb967"

  url "https://github.com/pbek/QOwnNotes/releases/download/v#{version}/QOwnNotes.dmg",
      verified: "github.com/pbek/QOwnNotes/"
  name "QOwnNotes"
  desc "Plain-text file notepad and todo-list manager"
  homepage "https://www.qownnotes.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "QOwnNotes.app"

  uninstall quit: "com.PBE.QOwnNotes"

  postflight do
    system_command '/usr/bin/xattr',
      args: ['-r', '-d', 'com.apple.quarantine', "#{appdir}/QOwnNotes.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.pbe.QOwnNotes.plist",
    "~/Library/Saved Application State/com.PBE.QOwnNotes.savedState",
  ]
end
