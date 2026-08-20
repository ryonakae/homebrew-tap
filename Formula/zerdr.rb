class Zerdr < Formula
  desc "Keep Herdr sessions aligned with their Git checkouts in Zed"
  homepage "https://github.com/ryonakae/zerdr"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.2.0/zerdr-aarch64-apple-darwin.tar.xz"
      sha256 "a1df6ad8c800c294fd1f81a094729bc03705ca7ffc0d4f88d2c2ca3c3344e78c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.2.0/zerdr-x86_64-apple-darwin.tar.xz"
      sha256 "749ea7f36b7933106202e2b6a73ed316a94b281234a00d6d014113a95619380e"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.2.0/zerdr-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e572c213b174b3a50d139245cf71f54df7261477192354cc04775c0d673c3753"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.2.0/zerdr-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "baa027e9345c1fa9e18d75700d315e32302a0a492878ff884a4536267e17487e"
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
