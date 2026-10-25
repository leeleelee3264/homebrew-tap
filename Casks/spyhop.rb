cask "spyhop" do
  version "2.1.0"
  sha256 "3a61e4d920f033e3fca9e74d9b1e09a41195c7de5834d0f00a3bffa65412e1a3"

  url "https://github.com/leeleelee3264/spyhop/releases/download/v#{version}/Spyhop-#{version}.dmg"
  name "Spyhop"
  desc "Every AI coding session on one board, each with its own progress"
  homepage "https://github.com/leeleelee3264/spyhop"

  depends_on macos: ">= :ventura"

  app "Spyhop.app"

  # Not signed with an Apple Developer ID, so let it open without the Gatekeeper prompt
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Spyhop.app"]
  end

  uninstall quit: "io.github.leeleelee3264.spyhop"

  zap trash: [
    "~/.spyhop",
    "~/Library/LaunchAgents/com.spyhop.app.plist",
    "~/Library/LaunchAgents/com.spyhop.board.plist",
  ]

  caveats <<~EOS
    Spyhop needs the Xcode Command Line Tools (xcode-select --install) and a logged-in claude or codex CLI.
    Coming from the browser version? Open Spyhop once; it takes over the board and offers to clean up the old version.
  EOS
end
