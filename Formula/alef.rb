# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.4.tar.gz"
  sha256 "07a3b108ec6d8a663a33aff7d673cacfa64acecf4c00173bddd1a032fbe95094"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.3"
    sha256 cellar: :any, arm64_linux: "fbe4f47eda28d24a662fb7118d45703e5f0c0955c13b6e3aff77483cf4127b0c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0d6d63b919440b3db8d1de9e57de41a7b6d33e630d04a174bed9ab179ead2446"
    sha256 cellar: :any_skip_relocation, sequoia: "cd9170ef4d540026686f8e27fd2dd7e5e43b7c286c1349dc5b4e00b9424f082c"
    sha256 cellar: :any, x86_64_linux: "11808beab28ebff6b658deb9ee2a71efa031bdcd206f9ac96ddf19146636f53f"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
