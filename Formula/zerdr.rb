class Zerdr < Formula
  desc "Keep Herdr sessions aligned with their Git checkouts in Zed"
  homepage "https://github.com/ryonakae/zerdr"
  version "0.7.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.7.0/zerdr-aarch64-apple-darwin.tar.xz"
      sha256 "7fac782b93b7c03898b210b81158d39ca56d5307672ae27ee5aae34b1cca8250"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.7.0/zerdr-x86_64-apple-darwin.tar.xz"
      sha256 "29a3127578e102fe7ea9bc7371d1a23fffd2ab0330d543a254022e6db7afde13"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.7.0/zerdr-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1949a7d37fef5ae6fcec7720f7a18e0bd392a4dc5512d43e09a583def286efe8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.7.0/zerdr-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c71bda5eaab8ef56fea5c73f6298932164fb03abe07d015997d75ebac1e8cbdc"
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
