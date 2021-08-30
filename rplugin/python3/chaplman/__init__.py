import pynvim
from pynvim.api.nvim import Nvim


@pynvim.plugin
class PynvimTest(object):
    def __init__(self, nvim: Nvim):
        self.nvim = nvim

    def vimecho(self, msg):
        self.nvim.command("echo \"" + msg + "\"")

    @pynvim.command('ChaplmanTest')
    def testcommand(self):
        self.nvim.out_write("Chaplman : test\n")
