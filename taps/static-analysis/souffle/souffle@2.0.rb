class SouffleAT20 < Formula
  desc "Translator of declarative Datalog programs into the C++ language."
  homepage "https://github.com/souffle-lang/souffle/wiki"
  stable do
    url "https://github.com/souffle-lang/souffle/archive/refs/tags/2.0.2.tar.gz"
    sha256 "2255a7b4fefa636bc1b9eca83142737b342567f7b48db9e2a91ded37056999d3"
  end
  head "https://github.com/souffle-lang/souffle.git", :shallow => false

  depends_on "libtool" => :build
  depends_on "bison" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libffi" => :build
  depends_on "mcpp"
  depends_on "pkg-config" => :build

  def install
    if build.head?
      system "git", "fetch", "--tags"
    end

    system "sed", "-i'.bak'", "-e", "/AC_CONFIG_MACRO_DIR(/d", "configure.ac"
    system "./bootstrap"

    system "./configure", "--prefix=#{prefix}"
    system "make -j"
    system "make", "install"
  end

  test do
    system "false"
  end
end
