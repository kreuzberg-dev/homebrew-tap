# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.48.tar.gz"
  sha256 "520b315e2478d1b0dfe80c8bd79da63729b4cd068e34db928433831a020a7e3a"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.48"
    sha256 cellar: :any_skip_relocation, arm64_linux: "4fa37fb470408fe458c4e3c023764f2a4e3b559dbff71ff6ae0ad8668ebae72c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "94231dc6359549fd9496f83e9b8524464e88839bd815e393d79ae01f3cc99ac9"
    sha256 cellar: :any_skip_relocation, sequoia: "e6ae3b967a2adc346afb3f6b693f30da46266f370f43162eb7b03ec7274ae4c0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e0427bf26e04e6f01215edb5a6dc7506368b4217ccac0f3acbf13646be530fa3"
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
