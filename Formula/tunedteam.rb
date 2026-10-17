class Tunedteam < Formula
  desc "Multi-agent dev environment for Claude Code in tmux"
  homepage "https://github.com/zdzislawbela/tunedteam"
  license "MIT"
  url "https://github.com/zdzislawbela/tunedteam/archive/refs/tags/v0.2.25.tar.gz"
  sha256 "737d2a832859a6125967d97267ddca3eadfc5f470e1984123c381d00373ef164"
  head "https://github.com/zdzislawbela/tunedteam.git", branch: "main"

  depends_on "tmux"

  def install
    libexec.install "bin", "roles", "tmux.conf", "VERSION", "INSIDE-OUT.md"
    bin.install_symlink libexec/"bin/tunedteam"
  end

  def caveats
    <<~TXT
      Tuned Team runs Claude Code: install it first if needed (brew install --cask claude-code).
      Then, in a project folder: tunedteam
    TXT
  end

  test do
    assert_match "multi-agent dev environment", shell_output("#{bin}/tunedteam help 2>&1", 1)
  end
end
