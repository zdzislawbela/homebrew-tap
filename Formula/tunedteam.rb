class Tunedteam < Formula
  desc "Multi-agent dev environment for Claude Code in tmux"
  homepage "https://github.com/zdzislawbela/tunedteam"
  license "MIT"
  url "https://github.com/zdzislawbela/tunedteam/archive/refs/tags/v0.2.17.tar.gz"
  sha256 "2497feefcddc7e39e84e711238a13d7bf715066fa2fec749e7d9c746b72a1b0e"
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
