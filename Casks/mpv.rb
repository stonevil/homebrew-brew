cask "mpv" do
  name "mpv"
  desc "Media player"
  homepage "https://mpv.io/"

  depends_on macos: ">= :big_sur"
  arch arm: "arm64", intel: "x86_64"

  on_arm do
    version "0.40.0"
    sha256 "3170fb709defebaba33e9755297d70dc3562220541de54fc3d494a8309ef1260"
    url "https://laboratory.stolendata.net/~djinn/mpv_osx/mpv-#{arch}-#{version}.tar.gz"

   app "mpv-#{arch}-#{version}/mpv.app"
  end
  on_intel do
    version "0.39.0"
    sha256 "35ec81ad86a97b24956a8d0f4fa1ba2690b44ae7741c920e923620bcd7bd402a"
    url "https://laboratory.stolendata.net/~djinn/mpv_osx/mpv-#{version}.tar.gz"

   app "mpv-#{version}/mpv.app"
  end

  postflight do
    system_command '/usr/bin/xattr'
      args: ['-r', '-d', 'com.apple.quarantine', "#{appdir}/mpv.app"]
  end

  zap trash: [
    "~/Library/Logs/mpv.log",
  ]
end
