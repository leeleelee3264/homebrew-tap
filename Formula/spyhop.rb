class Spyhop < Formula
  desc "Board of every Claude Code and Codex session running in Orca"
  homepage "https://github.com/leeleelee3264/spyhop"
  url "https://github.com/leeleelee3264/spyhop/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2f5842b2f4fb702f5ba2eae11d90cc55ce729cc9668ca39eaa643b98b810cf99"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"spyhop"
  end

  def caveats
    <<~EOS
      Run `spyhop` to start the board and open it.
      It needs Orca and one summarizer: the claude or codex CLI logged in, or a DeepSeek API key.

      Menu bar icon (optional): install SwiftBar, then
        ln -s #{opt_libexec}/menubar/spyhop.5s.py "<SwiftBar plugin folder>/spyhop.5s.py"
    EOS
  end

  test do
    system "/usr/bin/python3", "-c", "import ast,sys; ast.parse(open(sys.argv[1]).read())", libexec/"board.py"
  end
end
