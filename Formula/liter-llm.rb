# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.34.tar.gz"
  sha256 "3a13e91ce2380024842bbc889e47cae6dc1d963c5893fd2de7e63f4ac8b59a45"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.33"
    sha256 cellar: :any_skip_relocation, arm64_linux: "bcc73e9ec9e703d3870ac63cfd9c80e313eda08a94edd0c9bff6977ebb7f75d7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e6f676b21f6cdf0ea782ce09998bb11407a7d1477b7dfc0446b5d75787e2db82"
    sha256 cellar: :any_skip_relocation, sequoia: "0a9e697cce7613be02de911e606f5468757359e7c0da8b561fb884329bf903c4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "58f958795cb33c29b77c6011c1ac6832fe60415725ecb7c77e2478a90522dc9c"
  end
  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
