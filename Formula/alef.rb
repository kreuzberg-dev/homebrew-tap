# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.12.tar.gz"
  sha256 "2cbc637b3145e520bc39151dd17beeb3e7562bd86d60c787d636714ce1b4c255"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.20.9"
    sha256 cellar: :any_skip_relocation, arm64_linux: "28afd65206ffdc043d9b33ea4b5ae5bfed93f48b8e2b01239ce99de7e66ce65e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "59ed8417c847994eae54477f0515c2f1d923d476bb4a94fd259f65f3845acc2b"
    sha256 cellar: :any_skip_relocation, sequoia: "d5d4ff38cad36b6d263413a7cba0d69875d3de40543ac7799404b8fb2cea463b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c0a6c6866efb64cd2818129e48a17f913f83743b533e57bb28b953418efb3a48"
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
