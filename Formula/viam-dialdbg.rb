class ViamDialdbg < Formula
  desc "Viam dial debugger"
  homepage "https://www.viam.com/"
  url "https://github.com/viamrobotics/rust-utils.git",
    tag:      "v0.2.13",
    revision: "2baf10b2f54dcde068b05fce58efd34e3b928030"
  license "Apache-2.0"
  head "https://github.com/viamrobotics/rust-utils.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "make", "build-dialdbg"
    bin.install "target/release/viam-dialdbg"
  end

  def caveats
    <<~EOS
      viam-dialdbg may have installed Rust as a dependency via brew. If you
      manage your own Rust installations (via rustup, etc.), you can run `brew
      remove rust` or `brew unlink rust` after installing.
    EOS
  end
end
