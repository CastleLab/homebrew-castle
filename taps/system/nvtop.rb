class Nvtop < Formula
  desc "Nvtop stands for NVidia TOP, a (h)top like task monitor for NVIDIA GPUs. It can handle multiple GPUs and print information about them in a htop familiar way."
  homepage "https://github.com/Syllo/nvtop"
  stable do
    url "https://github.com/Syllo/nvtop/archive/refs/tags/1.1.0.tar.gz"
    sha256 "00470cde8fc48d5a5ed7c96402607e474414d94b562b21189bdde1dbe6b1d1f3"
  end
  head "https://github.com/Syllo/nvtop.git", :shallow => false

  depends_on "ncurses" => :build

  def install
    if build.head?
      system "git", "fetch", "--tags"
    end

    system "mkdir", "build"
    Dir.chdir('build')
    system "cmake", "..", "-DNVML_RETRIEVE_HEADER_ONLINE=True", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}"
    system "make -j"
    system "make install"
  end

  test do
    system "false"
  end
end
