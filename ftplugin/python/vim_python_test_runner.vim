if !has('python')
    finish
endif

if !exists("g:debug_vim_test_runner")
    let g:debug_vim_test_runner=0
endif

function! RunAllTestsForCurrentApp()
python << endPython
import os
import vim
import inspect
from sys import platform as _platform
# Add our python script to the path for importing
for path in vim.eval('&runtimepath').split(','):
    if 'vim-python' in path and "after" not in path:
        sys.path.append(os.path.join(path, 'ftplugin', 'python'))
from vim_python_test_runner import *

current_directory = os.sep.join([dir for dir in vim.current.buffer.name.split(os.sep) if dir])
current_line = vim.current.line
run_app_tests_command = get_command_to_run_the_current_app(current_directory)
if ".vim-django file does not exist or is improperly formated. ':help run-django-tests'" == run_app_tests_command:
    print(".vim-django file does not exist or is improperly formated. ':help run-django-tests'")
elif "Are you sure this is a Django project?" == run_app_tests_command:
    print("Are you sure this is a Django project?")
elif vim.eval("g:debug_vim_test_runner") == "1":
    print(">>>>>>>>>>DEBUGGING MODE<<<<<<<<<<\nAttempting to run the following command\n{0}".format(run_app_tests_command))
else:
    if _platform == 'linux' or _platform == 'linux2':
        vim.command(":!python {0}".format(run_app_tests_command))
    elif _platform == 'darwin':
        vim.command(":!sudo python {0}".format(run_app_tests_command))
endPython
endfunction

command! DjangoTestApp call RunAllTestsForCurrentApp()


function! RunAllTestsForCurrentFile()
python << endPython
import os
import vim
import inspect
from sys import platform as _platform
# Add our python script to the path for importing
for path in vim.eval('&runtimepath').split(','):
    if 'vim-python' in path and "after" not in path:
        sys.path.append(os.path.join(path, 'ftplugin', 'python'))
from vim_python_test_runner import *

current_directory = os.sep.join([dir for dir in vim.current.buffer.name.split(os.sep) if dir])
current_line = vim.current.line
run_file_tests_command = get_command_to_run_the_current_file(current_directory)
if ".vim-django file does not exist or is improperly formated. ':help run-django-tests'" == run_file_tests_command:
    print(".vim-django file does not exist or is improperly formated. ':help run-django-tests'")
elif "Are you sure this is a Django project?" == run_file_tests_command:
    print("Are you sure this is a Django project?")
elif vim.eval("g:debug_vim_test_runner") == "1":
    print(">>>>>>>>>>DEBUGGING MODE<<<<<<<<<<\nAttempting to run the following command\n{0}".format(run_file_tests_command))
else:
    if _platform == 'linux' or _platform == 'linux2':
        vim.command(":!python {0}".format(run_file_tests_command))
    elif _platform == 'darwin':
        vim.command(":!sudo python {0}".format(run_file_tests_command))
endPython
endfunction

command! DjangoTestFile call RunAllTestsForCurrentFile()


function! RunTestsForCurrentClass()
python << endPython
import os
import vim
import inspect
from sys import platform as _platform
# Add our python script to the path for importing
for path in vim.eval('&runtimepath').split(','):
    if 'vim-python' in path and "after" not in path:
        sys.path.append(os.path.join(path, 'ftplugin', 'python'))
from vim_python_test_runner import *

current_directory = os.sep.join([dir for dir in vim.current.buffer.name.split(os.sep) if dir])
current_line = vim.current.line
run_class_tests_command = get_command_to_run_the_current_class(current_directory, current_line, vim.current.buffer)
if ".vim-django file does not exist or is improperly formated. ':help run-django-tests'" == run_class_tests_command:
    print(".vim-django file does not exist or is improperly formated. ':help run-django-tests'")
elif "Are you sure this is a Django project?" == run_class_tests_command:
    print("Are you sure this is a Django project?")
elif vim.eval("g:debug_vim_test_runner") == "1":
    print(">>>>>>>>>>DEBUGGING MODE<<<<<<<<<<\nAttempting to run the following command\n{0}".format(run_class_tests_command))
else:
    if _platform == 'linux' or _platform == 'linux2':
        vim.command(":!python {0}".format(run_class_tests_command))
    elif _platform == 'darwin':
        vim.command(":!sudo python {0}".format(run_class_tests_command))
endPython
endfunction

command! DjangoTestClass call RunTestsForCurrentClass()


function! RunCurrentMethodTest()
python << endPython
import os
import vim
import inspect
from sys import platform as _platform
# Add our python script to the path for importing
for path in vim.eval('&runtimepath').split(','):
    if 'vim-python' in path and "after" not in path:
        sys.path.append(os.path.join(path, 'ftplugin', 'python'))
from vim_python_test_runner import *

current_directory = os.sep.join([dir for dir in vim.current.buffer.name.split(os.sep) if dir])
current_line = vim.current.line
run_method_test_command = get_command_to_run_the_current_method(current_directory, current_line, vim.current.buffer)
if ".vim-django file does not exist or is improperly formated. ':help run-django-tests'" == run_method_test_command:
    print(".vim-django file does not exist or is improperly formated. ':help run-django-tests'")
elif "Are you sure this is a Django project?" == run_method_test_command:
    print("Are you sure this is a Django project?")
elif vim.eval("g:debug_vim_test_runner") == "1":
    print(">>>>>>>>>>DEBUGGING MODE<<<<<<<<<<\nAttempting to run the following command\n{0}".format(run_method_test_command))
else:
    if _platform == 'linux' or _platform == 'linux2':
        vim.command(":!python {0}".format(run_method_test_command))
    elif _platform == 'darwin':
        vim.command(":!sudo python {0}".format(run_method_test_command))
endPython
endfunction

command! DjangoTestMethod call RunCurrentMethodTest()


function! RunNosetestsForCurrentFile()
python << endPython
import os
import vim
import inspect
# Add our python script to the path for importing
for path in vim.eval('&runtimepath').split(','):
    if 'vim-python' in path and "after" not in path:
        sys.path.append(os.path.join(path, 'ftplugin', 'python'))
from vim_python_test_runner import *

#current_directory = os.sep.join([dir for dir in vim.current.buffer.name.split(os.sep) if dir])
current_directory = vim.current.buffer.name
run_file_nosetests_command = get_command_to_run_current_file_with_nosetests(current_directory)
if vim.eval("g:debug_vim_test_runner") == "1":
    print(">>>>>>>>>>DEBUGGING MODE<<<<<<<<<<\nAttempting to run the following command\n{0}".format(run_file_nosetests_command))
else:
    vim.command(run_file_nosetests_command)
endPython
endfunction

command! NosetestFile call RunNosetestsForCurrentFile()


function! RunNosetestsForCurrentClass()
python << endPython
import os
import vim
import inspect
# Add our python script to the path for importing
for path in vim.eval('&runtimepath').split(','):
    if 'vim-python' in path and "after" not in path:
        sys.path.append(os.path.join(path, 'ftplugin', 'python'))
from vim_python_test_runner import *

#current_directory = os.sep.join([dir for dir in vim.current.buffer.name.split(os.sep) if dir])
current_directory = vim.current.buffer.name
current_line = vim.current.line
run_file_nosetests_command = get_command_to_run_current_class_with_nosetests(current_directory, current_line, vim.current.buffer)
if vim.eval("g:debug_vim_test_runner") == "1":
    print(">>>>>>>>>>DEBUGGING MODE<<<<<<<<<<\nAttempting to run the following command\n{0}".format(run_file_nosetests_command))
else:
    vim.command(run_file_nosetests_command)
endPython
endfunction

command! NosetestClass call RunNosetestsForCurrentClass()


function! RunNosetestsForCurrentMothod()
python << endPython
import os
import vim
import inspect
# Add our python script to the path for importing
for path in vim.eval('&runtimepath').split(','):
    if 'vim-python' in path and "after" not in path:
        sys.path.append(os.path.join(path, 'ftplugin', 'python'))
from vim_python_test_runner import *

#current_directory = os.sep.join([dir for dir in vim.current.buffer.name.split(os.sep) if dir])
current_directory = vim.current.buffer.name
current_line = vim.current.line
run_file_nosetests_command = get_command_to_run_current_method_with_nosetests(current_directory, current_line, vim.current.buffer)
if vim.eval("g:debug_vim_test_runner") == "1":
    print(">>>>>>>>>>DEBUGGING MODE<<<<<<<<<<\nAttempting to run the following command\n{0}".format(run_file_nosetests_command))
else:
    vim.command(run_file_nosetests_command)
endPython
endfunction

command! NosetestMethod call RunNosetestsForCurrentMothod()
