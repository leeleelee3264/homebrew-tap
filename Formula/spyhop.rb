class Spyhop < Formula
  desc "Every AI coding session on one board, each with its own progress"
  homepage "https://github.com/leeleelee3264/spyhop"
  url "https://github.com/leeleelee3264/spyhop/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "ede06cb92b9913ea70428215fbb54a68f414aa7bd50caaa3793d08dff7ec3c41"
  license "MIT"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"spyhop"
  end

  def caveats
    <<~EOS
      Run `spyhop` to start the board and open it.
      It needs one summarizer: the claude or codex CLI logged in, or a DeepSeek API key. Orca is optional.

      Menu bar icon (optional): brew install --cask swiftbar, then run `spyhop` again.
    EOS
  end

  test do
    system "/usr/bin/python3", "-c", "import ast,sys; ast.parse(open(sys.argv[1]).read())", libexec/"board.py"
  end
end
