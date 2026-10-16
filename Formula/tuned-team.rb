class TunedTeam < Formula
  desc "Multi-agent dev environment for Claude Code in tmux"
  homepage "https://github.com/zdzislawbela/tuned-team"
  url "https://github.com/zdzislawbela/tuned-team/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "SHA256_OF_THE_TAG_TARBALL"
  head "https://github.com/zdzislawbela/tuned-team.git", branch: "main"

  depends_on "tmux"

  def install
    libexec.install "bin", "roles", "tmux.conf"
    bin.install_symlink libexec/"bin/tuned-team"
  end

  def caveats
    <<~TXT
      Tuned Team runs Claude Code: install it first if needed (brew install --cask claude-code).
      Then, in a project folder: tuned-team
    TXT
  end

  test do
    assert_match "multi-agent dev environment", shell_output("#{bin}/tuned-team help 2>&1", 1)
  end
end
