# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.1.tar.gz"
  sha256 "c541afc3592d763759bdcdb23e979f7790c37a73fba0625ce0dd6cc3da9c27d4"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.20.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "87a5bb3926a50179fc1e29a62ba7685b09738403aaf8faad5fe5ad688043c970"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f639a9bc4d77c68a1933a059ceeb8689e2981ad0b87ac35c9822fbccb77ab4ff"
    sha256 cellar: :any_skip_relocation, sequoia: "0335ea46f4fd19debeb1eecd149485fb28c1e2e71cee9e76536cedc71e17c1a4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9744ab9de92fe5964c31719f0a3d58656f1beda01338869c6d1f646abf72322b"
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
