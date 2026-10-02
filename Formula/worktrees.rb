class Worktrees < Formula
  desc "Fast git worktree manager"
  homepage "https://wt.glevski.com"
  version "0.0.18"

  on_macos do
    on_arm do
      url "https://github.com/glevski/wt/releases/download/#{version}/worktree-darwin-arm64.tar.gz"
      sha256 "f75cf29fc92987287ec0446b44dc8411d9e4444c73348f3b59e0f73acc1faa7b"
    end
    on_intel do
      url "https://github.com/glevski/wt/releases/download/#{version}/worktree-darwin-amd64.tar.gz"
      sha256 "83faf8638da1aa7d381420a31b07739503388029519f8a2d04121165686422b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glevski/wt/releases/download/#{version}/worktree-linux-arm64.tar.gz"
      sha256 "1512454de393cc52ea466b2450c4bd3bd7d41e86c1c9bf175adb0f17e708b713"
    end
    on_intel do
      url "https://github.com/glevski/wt/releases/download/#{version}/worktree-linux-amd64.tar.gz"
      sha256 "c8fcd9b2c9fe69b35206505c2135096a7a04629ee359387f248ddcc62d8e6123"
    end
  end

  def install
    bin.install "worktree"
  end

  def caveats
    <<~EOS
      To get the `wt` command, add this to your ~/.zshrc (or ~/.bashrc with `bash`):
        eval "$(worktree init zsh)"
    EOS
  end

  test do
    assert_match "wt #{version}", shell_output("#{bin}/worktree --version")
    system "git", "init"
    system "git", "-c", "user.name=t", "-c", "user.email=t@example.com",
           "commit", "--allow-empty", "-m", "init"
    system bin/"worktree", "link", "demo"
    assert_match "demo", shell_output("#{bin}/worktree status")
  end
end
