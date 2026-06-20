# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.55.tar.gz"
  sha256 "ba714a55d494e0dc24bfd9b65ed990f1e8a37fb07fe12f3983742262002f6e02"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.54"
    sha256 cellar: :any, arm64_linux: "552548cd77e6bb630ad817ce3ed88f654d7ebd288aec0a715b8a2735838bdd3f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "11fd06550894d94c7d97d237e720315ecbf9da7fa5b3079c8844ac6ab662b285"
    sha256 cellar: :any_skip_relocation, sequoia: "910cb32faa94cc5bb28491972f67393747e288133cc4e64424e97f293e96575f"
    sha256 cellar: :any, x86_64_linux: "6cea2e089fb7b8f44853fa678e39f5a226561306dbe8a09898e90c41389d91f7"
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
