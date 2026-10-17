class Tunedteam < Formula
  desc "Multi-agent dev environment for Claude Code in tmux"
  homepage "https://github.com/zdzislawbela/tunedteam"
  url "https://github.com/zdzislawbela/tunedteam/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "7b8434ae903c5c4b9807858cb8c30e8caba020b7ac774e44aede058a77e02b81"
  head "https://github.com/zdzislawbela/tunedteam.git", branch: "main"

  depends_on "tmux"

  def install
    libexec.install "bin", "roles", "tmux.conf", "VERSION"
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
