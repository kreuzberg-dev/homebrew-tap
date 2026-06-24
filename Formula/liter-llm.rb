# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://xberg.io'
  url "https://github.com/xberg-io/liter-llm/archive/v1.8.2.tar.gz"
  sha256 "e1d10c3346feab5e7adcc31e0732a3b18c569a827faef01531d9063985a02e89"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.8.2"
    sha256 cellar: :any, arm64_linux: "b4ff8f9b90e811f8e57f8161492fde7725771e9cbd369f934d0f67ade8d115d7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8c4c8edd6742fe1b5cbd32e7f49f107326c1d158804a9d2d02462e3eff350d18"
    sha256 cellar: :any_skip_relocation, sequoia: "d8339706b29c5019863d6b6fe2933ee40349d87771790b4581310d2fac014dbd"
    sha256 cellar: :any, x86_64_linux: "3d973bdca393c2eafefe794b815185fb48337f890a8bfa72dcdea03f0ddb6c7f"
  end

  head 'https://github.com/xberg-io/liter-llm.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
