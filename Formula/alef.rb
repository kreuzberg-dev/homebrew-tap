# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.34.tar.gz"
  sha256 "54fafe07e8d46a5c1c902a862833987e0f0a1db253bca19d59739d9a9d35c0a0"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.34"
    sha256 cellar: :any, arm64_linux: "60bc5c903e7cb84b1da27fd094f96238d379235d46fe8a412997e839af3807de"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ee3f3c4c57b61df28d438719392edd5b75f1637a19d97a2a427260c8bb1939a6"
    sha256 cellar: :any_skip_relocation, sequoia: "f0e1ee98f775eace83adc111e7eafb587cfaa6a4cfa1d114acb1ef2a3ff07985"
    sha256 cellar: :any, x86_64_linux: "9de18a1a3e6779b507a0430f0464f56c030a68ceacf602330b35885defd85615"
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
