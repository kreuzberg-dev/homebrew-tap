# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://xberg.io'
  url "https://github.com/xberg-io/liter-llm/archive/v1.9.0.tar.gz"
  sha256 "7ddaca09d4404d45135eb61227d1cf56aee7e0ec5f29954ffcafb0da5a06b229"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.9.0-rc.2"
    sha256 cellar: :any, arm64_linux: "441d92dfadb29916f7c4c33f3e02b6880ac444f41fd47692d389148cd10b89b4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "5e56bbfdb2351aec76ef61d4f64b66725f94d23683cdb49f58ad477b15805c0b"
    sha256 cellar: :any_skip_relocation, sequoia: "294c73aaaaf1f3c4285b809fd7dbb3a7104d52df8253fe814e100395814d067f"
    sha256 cellar: :any, x86_64_linux: "380f948715418a95eb783312349a5d658afe85a018a8ccb417f1662a0193bcd2"
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
