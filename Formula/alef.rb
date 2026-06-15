# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.11.tar.gz"
  sha256 "265b7071e017ac97817f06e833c0c994a2c7527d36fb8be4f25fca0e76ef3574"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.10"
    sha256 cellar: :any, arm64_linux: "1efa483178d0eeebacd8d7775ca9c3e2c1479b01d9953b12068a76926e414c12"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a9631108c3390ea97f8abcb6077e09d4885b8aabe03d090c7bd7e0ed48ba64e9"
    sha256 cellar: :any_skip_relocation, sequoia: "c830a3e561cdf4a3918b0160ae0abed70371083afa36b4fd59bf6529bc38bc12"
    sha256 cellar: :any, x86_64_linux: "e8d89cf130fbad5b10a40a413dae5f0be6034920b8440e16813e4b93e0b0153d"
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
