# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.57.tar.gz"
  sha256 "66533a27794eb8b83f00b3ce700c47c9b6a3814304dc5dd1158a1dfb418ead8d"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.57"
    sha256 cellar: :any, arm64_linux: "198d47abee55ba0931c8a3d8ba1773a7d850332b21642e4975229934fd75f5cf"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8c635ba9462e662d4586862ac31872b793e2bebaff38548a0a92bec28c3c7551"
    sha256 cellar: :any_skip_relocation, sequoia: "881a1b4b73ef52b740c394c8dd18c547842c0cd23c3a08bf5b3668df449b99d4"
    sha256 cellar: :any, x86_64_linux: "5b799667121e9883d0f6ceaba5b30e51f4566b1e7b7aa6e729982a34e54dba86"
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
