# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.20.tar.gz"
  sha256 "913d8461d567f30e6aaff50593cfe099d78df108b3fb2b6b344525792fde9eb0"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.18"
    sha256 cellar: :any, arm64_linux: "86d4b70c98836d7c479e6a6cf39989ec725890d2ee439eaa2bc4b18a17449f66"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4455b354ed5d752fb216cf5b97985913a6f853330f8087b2f6354303181b1c12"
    sha256 cellar: :any_skip_relocation, sequoia: "76afb17f0ccf6c4b5b75e1352175876df780eb5cd334b565608faae81bc4ad57"
    sha256 cellar: :any, x86_64_linux: "c3aaa479646a9091e9e79ae75f535dbf67097f658d57c67ac09911acc2e310af"
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
