# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.21.tar.gz"
  sha256 "bc8db816a2e722cfa4cb7e91e6b2851ddeaeb66f0f876640d46b3acf71837de3"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.19"
    sha256 cellar: :any, arm64_linux: "353cac5caf637d2d26996b5d77343195b4834ba787060809fd82ad0d9425e505"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d01fb65fead0fe0d694aad40a34ea52a3da76bee2ee342f8bc0df8cbdad1c634"
    sha256 cellar: :any_skip_relocation, sequoia: "1d8fc2d098ef8c4e129d4ba7649bdb731dba0506aa3c0009d94a73023a9665f1"
    sha256 cellar: :any, x86_64_linux: "40aa1d2e8a4161ed394312078a36283dea38e245ef4e9cee9936298a26f157e5"
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
