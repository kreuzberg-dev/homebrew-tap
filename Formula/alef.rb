# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.27.1.tar.gz"
  sha256 "d45969f98d2a2576b43d8cc1aeaa22d056dc1b923f7d2e2016149b00c31e4139"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.27.0"
    sha256 cellar: :any, arm64_linux: "56e9881754ed7f96eeaf84ef26ac0342571033397e3d93f99ab5cfc3f1c18a19"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "987a7083dad886096e6274c209e4650d146fa275d0b16c4eb20f5c9c3c9a56d4"
    sha256 cellar: :any_skip_relocation, sequoia: "36d6663e08b8dd80ff1d8b760affef5f271ad4ef8096bf09672247f106564b6d"
    sha256 cellar: :any, x86_64_linux: "2b3f8e176c6115bfe6d61683b310dcb51b9e831bf862ca3777181bf72f224bcc"
  end

  head 'https://github.com/kreuzberg-dev/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
