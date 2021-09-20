import pathlib
import re
import shutil
import os
import sys


def dircp(From, To):
    # From ... full-path, To ... full-pat
    To = dirFormat(To)
    current = pathlib.Path(From)
    from_objs = [i for i in list(pathlib.Path(From).glob('**/*')) if re.match(
        r'\.git', str(i.relative_to(current))) is None
        and re.match(r'LICENSE', str(i.relative_to(current))) is None
        and re.match(r'README.md', str(i.relative_to(current))) is None
    ]
    relative = [i.relative_to(current) for i in from_objs]
    to_objes = [pathlib.Path(To+str(i)) for i in relative]
    # print(current)
    # print(from_objs)
    pairs = make_pair(from_objs, to_objes)
    for i in pairs:
        Copy_from_pair(i)


def make_pair(From, To):
    return [[i, j] for i, j in zip(From, To)]


def Copy_from_pair(pair):
    if pair[0].is_dir():
        if not os.path.isdir(str(pair[1])):
            os.mkdir(str(pair[1]))
    else:
        shutil.copy(str(pair[0]), str(pair[1]))


def make_package(pack_list, target):
    for i in pack_list:
        dircp(i, target)


def dirFormat(path):
    if re.match(r'/$', path) is None:
        return path+"/"
    else:
        return path


if __name__ == "__main__":
    #    make_package(["/root/Documents/Vim/VimTestPlugin.nvim",
    #                  "/root/_nvim/dein/repos/github.com/Shougo/ddc.vim"],
    #                 "/root/Documents/Vim/Chaplman.vim/test/hoge")
    args = sys.argv
    packlist = args[1:-1]
    target = args[-1]
    #make_package(packlist, target)
    print(packlist, target)
