class Zerdr < Formula
  desc "Keep Herdr sessions aligned with their Git checkouts in Zed"
  homepage "https://github.com/ryonakae/zerdr"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.3.0/zerdr-aarch64-apple-darwin.tar.xz"
      sha256 "0d0ff35a0e8a401cdb3aedcd081a0164817d1b083d4a718e6dfbc9fa7708eef3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.3.0/zerdr-x86_64-apple-darwin.tar.xz"
      sha256 "f1ab3827f12b4322e5bdeba0fc2bc960531eb9e5008c28acea6be4d84828a101"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.3.0/zerdr-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "bdff3e0e99a00f733af004050249dc344c21a78c7f6d9406bf67ac619ed7977d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.3.0/zerdr-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "228ace75de89485b605ddb47fb3fba794eee854793f1f70e7594f992952d81c6"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "zerdr"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "zerdr"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "zerdr"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "zerdr"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
