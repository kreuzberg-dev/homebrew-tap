# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.29.tar.gz"
  sha256 "093cebbade469100af719abacbceb034dda6d775f5f4fc6ba8ea3af373199438"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.29"
    sha256 cellar: :any, arm64_linux: "4a8f20a94132d1affe4de7f9a8877106bb52bbdf4e1be4adc7ee1c0fc9799076"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ed41be8fa814ae960502926efdfea50498bab9b26ea3daf5b719379b06b54b1f"
    sha256 cellar: :any_skip_relocation, sequoia: "18478f880b3edb036418a68168aaa58c0f55db41d7228ed818596d6ce8f958a6"
    sha256 cellar: :any, x86_64_linux: "fba5a08930157fc2dbefd7bb08f6aad44292835e8069d50a5c323034ad77c613"
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
