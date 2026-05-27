# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.19.23.tar.gz"
  sha256 "120df7cafc95c62927d06809bbf67f149895b81713b136e6e248cac9d6ff2175"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.19.22"
    sha256 cellar: :any_skip_relocation, arm64_linux: "d062211b0d510facf5228c30d4fa0a785dfa5c77c2dabb93da9fadd3a2958c62"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c716f9c13c83a7ca7ce3cd878863ef4888dd1a3b70d8d06ef5042c27cb5915c2"
    sha256 cellar: :any_skip_relocation, sequoia: "bd11cd7fa7753e4c06dad87ee484068fa6fe285f1591ed36bc061ebb56e16a8e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ef0963fbd4989b535aba8304dbe27d372dffd3c1e30212cc37e4f0e22e39eb40"
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
