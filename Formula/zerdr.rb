class Zerdr < Formula
  desc "Keep a dedicated Herdr session aligned with the current Zed window"
  homepage "https://github.com/ryonakae/zerdr"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.1.0/zerdr-aarch64-apple-darwin.tar.xz"
      sha256 "bdfdf50e3039a76fda4d3feca686e380002414cc28fa44c5f9cf52ca731c5579"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.1.0/zerdr-x86_64-apple-darwin.tar.xz"
      sha256 "236c2b591e419171c9a1b59b191d2ddee83a4ea1fa8ca3387682d2d230c7be8a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.1.0/zerdr-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "67c39784d3b7e300109e7d4eca5c4574efa3d7a226cd3fa722775f1b5e934a39"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.1.0/zerdr-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b90bccebe764de92360ce202c9d5f53241a59fc541def72954a5a2a2befee21d"
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
