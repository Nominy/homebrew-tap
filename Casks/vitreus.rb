cask "vitreus" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "9091b35b0db7659401e0d00412c6b1adfdddd830d54dba7ce672a51b389189eb",
         intel: "7e0f6f2c6b26c21c4097c2536a2fc4d26b334ec421d26dd6a1789254248ed8f4"

  url "https://github.com/Nominy/vitreus/releases/download/v#{version}/vitreus-macos-#{arch}.tar.gz"
  name "Vitreus"
  desc "Fast, no-nonsense photo viewer"
  homepage "https://nominy.github.io/vitreus"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Vitreus.app"
  binary "#{appdir}/Vitreus.app/Contents/MacOS/vitreus"

  # Ad-hoc signed, not notarized: drop the download quarantine so it opens.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Vitreus.app"]
  end

  zap trash: "~/Library/Application Support/Vitreus"
end
