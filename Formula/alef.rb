# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.15.tar.gz"
  sha256 "f1ec41c9f69a8802cd04a987f9cc0a0d8b112bac7ab6e976df72bde08e2aac70"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.8"
    sha256 cellar: :any_skip_relocation, arm64_linux: "df9aca5cf17bee82e6366289244f26f383f23d713de2d92fb00bc520ec87d997"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f45260861a4e513c0260b5dcec38cb14a5c5088ff010a329d851e7c4680de420"
    sha256 cellar: :any_skip_relocation, sequoia: "f70529d2a979e022ce424ea9d55580e2d209da15bc90ffab68375fd08c550912"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3243e3c7ac932a828a2b093187c636a081012d8183a4f0bc6d2a46c855a438c0"
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
