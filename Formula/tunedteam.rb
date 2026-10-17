class Tunedteam < Formula
  desc "Multi-agent dev environment for Claude Code in tmux"
  homepage "https://github.com/zdzislawbela/tunedteam"
  url "https://github.com/zdzislawbela/tunedteam/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "9e069565972f2f01bfabffb12117db235ae2803a9c48228b11fcba7c7d6401f7"
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
