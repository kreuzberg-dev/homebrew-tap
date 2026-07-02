# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.8.tar.gz"
  sha256 "e706c358ff6d24bb430d0e92f84e0d4514116e3b3162fd8d6472d599b49e9a67"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.8"
    sha256 cellar: :any, arm64_linux: "b3cb8fc75cbd82697de691e3e6cdc139e22b171b7576c89103a2f0a432ba4403"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8f59b882807c6c7197b6834877887f10d68b48027fbebca73fcae9be7242bb6f"
    sha256 cellar: :any_skip_relocation, sequoia: "152c2f0029cdd0cf281d43cab8a88ed8859d15b0135589c557c7e7029be330c8"
    sha256 cellar: :any, x86_64_linux: "f8f465a0af49bb2f1508a96dcfcb10b8977591e281a33fdbd4aa07d18e0458e5"
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
