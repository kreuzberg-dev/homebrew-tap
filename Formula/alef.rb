# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.33.tar.gz"
  sha256 "63d624c16e2fd307d22a860295443174b55a3ecdcd6224d056152e2e6a42bec7"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.33"
    sha256 cellar: :any, arm64_linux: "cf30a28ddc1a834cd72f7a400325e2aceb2e1707b77d8fd3cd9e934952f8a767"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4a87ca52a5734b4586e074cda64f49592bbf80c7b9337231651b15253b3a5230"
    sha256 cellar: :any_skip_relocation, sequoia: "16be81d648c32ecb73ebd8ddf68bd37b09d3b5601b97f10f6695b5bee93f07bd"
    sha256 cellar: :any, x86_64_linux: "5708bd7c7eebb840d51510fdea176c0644606bd9b1a376bb5741be1e20ca13db"
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
