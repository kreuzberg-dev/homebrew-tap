# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.7.tar.gz"
  sha256 "112f4671f70b8945696f3e251c8012b60d5a8002128c203b5110c3f460e8270d"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.5"
    sha256 cellar: :any, arm64_linux: "aacebb48ef0b8219e9915e4b0901d901be02ff865431a9ffadb20a0315c9be41"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "691babef43ee261d83798df39a974cce06772251390f61cd430868e295e35708"
    sha256 cellar: :any_skip_relocation, sequoia: "4518a64bf659d97a4d65574a9fed04ae46b01acf6bc92bc36ccf234875b702e7"
    sha256 cellar: :any, x86_64_linux: "faadc368ee8405f687a572dbf0b8a5a7880d146389262489bef7e6872dc5353d"
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
