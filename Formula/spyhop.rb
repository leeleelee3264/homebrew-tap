class Spyhop < Formula
  desc "Every AI coding session on one board, each with its own progress"
  homepage "https://github.com/leeleelee3264/spyhop"
  url "https://github.com/leeleelee3264/spyhop/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "2dad23e3119bd5884ef141ea1b3878afd8a7337da8852bc9d2b9d0538fabba0d"
  license "MIT"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"spyhop"
  end

  def caveats
    <<~EOS
      Run `spyhop` to start the board and open it.
      It needs Orca and one summarizer: the claude or codex CLI logged in, or a DeepSeek API key.

      Menu bar icon (optional): brew install --cask swiftbar, then run `spyhop` again.
    EOS
  end

  test do
    system "/usr/bin/python3", "-c", "import ast,sys; ast.parse(open(sys.argv[1]).read())", libexec/"board.py"
  end
end
