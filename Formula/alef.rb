# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.1.tar.gz"
  sha256 "cb0ed8724d820f94bdc66e7dad085cfbca32fd911de7e5bee2fb6ed79da7f595"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.0"
    sha256 cellar: :any, arm64_linux: "245b1cce93356b61d6ed5023a876dbfac9a9320f93637ff653b79f61c3609428"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "42b5bf9b68a5004ecd57e2bf0f7c59b1701b9de749a57b8c06cfd1a09decc533"
    sha256 cellar: :any_skip_relocation, sequoia: "3b80b3f803cfd093b89134bbd9e986e6af3ed9d25746d472df9092d0d65d5fad"
    sha256 cellar: :any, x86_64_linux: "080cdad43ba1d565d1ba4345656045838b9d2e259d0ca076d7e0fae35f9872ee"
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
