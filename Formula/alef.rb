# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.74.tar.gz"
  sha256 "b7dca6e6bfd0b3a0f66bed1100456d444f486869d3a808cbf7ca3ac4bd3eb811"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.73"
    sha256 cellar: :any, arm64_linux: "5434e7f74c92e2ffdeb0fe0b91c7f7131bd1c355dac15756c4ffab13bd350eaa"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "915301086619656f263e31bfa8061f046c92527ccd5797cd5fa5b2fd36e1efcf"
    sha256 cellar: :any_skip_relocation, sequoia: "2355fbd3472e5c178c38e7cfecf862b09f6fc4a8b58ad0f974a1b9234a2c8d25"
    sha256 cellar: :any, x86_64_linux: "2f11453a99caba1100624c460ef9155b65eb68d08c3402f22d3bba3e56b93707"
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
