import pynvim


@pynvim.plugin
class Chaplman(object):
    def __init__(self, nvim):
        self.nvim = nvim

    def vimecho(self, msg):
        self.nvim.command("echo \"" + msg + "\"")

    @pynvim.command('ChaplmanTest')
    def testcommand(self):
        self.nvim.out_write("Chaplman : test\n")

    @pynvim.function('Getplugins')
    def getplugins(self, args):
        self.nvim.current.line = (
            'Func %s' % (args))
