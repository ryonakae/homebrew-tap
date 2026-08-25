class Zerdr < Formula
  desc "Keep Herdr sessions aligned with their Git checkouts in Zed"
  homepage "https://github.com/ryonakae/zerdr"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.4.0/zerdr-aarch64-apple-darwin.tar.xz"
      sha256 "4eba8c51b5cc11e2068f9577f4efbd289e7ef0c689d8824ee795450493715938"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.4.0/zerdr-x86_64-apple-darwin.tar.xz"
      sha256 "c25ed2930dcda8d35695d59ac4229335e838ce5254e66e2087937cf3db03fff4"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.4.0/zerdr-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c10207ca12f7342618fa3da1d0b0d83e04655963f9da1cec8e2e67965c0f35a9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.4.0/zerdr-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8ca88e15a38db30d279198adc91646a94ecf7c85a3439bd7b8a6b94043e57bb6"
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
