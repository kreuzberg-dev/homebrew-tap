# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.5.tar.gz"
  sha256 "a199fbfb028e9a63b2d3a2cc79fac571148be8ea1d05e8a7fca7ba2037d924de"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.20.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "a9919eb16939cd3dcdf2b6551840d0565b01168bd6bb2b6ecc4685ff1ffebd9a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "08c24aafae5a9b5048f0e9dbbe221cef6b65c2e5ef4f63447d2c0f6a8784cdf8"
    sha256 cellar: :any_skip_relocation, sequoia: "df38bf856642589bd71bf7ee4b48d3566c3587af0cb583b6cae7830c530e0658"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "09d6b6d568299fb4131b298c655f4e3e002ed96eb14e53346a2567fea53a1791"
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
