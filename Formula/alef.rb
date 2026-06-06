# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.24.tar.gz"
  sha256 "762abf29302029a0c091e94d8d8ef03d1cab9f4007a99682d28cff4f2af4dd7b"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.23"
    sha256 cellar: :any, arm64_linux: "7e4f20f3d8dd289570fb83d53c7017f945d1053c8c9946362c8df80e0f3e7210"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3c004fe734e45f787c2bf6c0477c179999d6b89c24ce465a0be5c66a5af50f16"
    sha256 cellar: :any_skip_relocation, sequoia: "ba279b7391cb9d4be4ed63b40248cbc8c34c6c2e76bf549988046881d408049a"
    sha256 cellar: :any, x86_64_linux: "986ff9f16f07a7609a9d902f17f236bc2f7776d87f92cc06b3dd259540b437f1"
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
