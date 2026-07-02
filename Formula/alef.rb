# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.6.tar.gz"
  sha256 "7881f970fc297ad2fb8c501c6c5905815e84a4ae689db4101292a2000e8bf442"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.6"
    sha256 cellar: :any, arm64_linux: "9de64ae250fc04901e754afcf8c53421724eb49b223d535fc125659c9a5b135f"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9e7aafa2661bd010ed7cdaf6e3991bb80e9ea07cfddf6fdd09f22d269055b679"
    sha256 cellar: :any_skip_relocation, sequoia: "f76cd14965d23aa59f24d7d80078b900869f8fd60accc826560d7e48d7ac2c8e"
    sha256 cellar: :any, x86_64_linux: "bc4146c62ef16a540a748f58890358deb8e433516d5fbc41ed5584376afc7184"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
