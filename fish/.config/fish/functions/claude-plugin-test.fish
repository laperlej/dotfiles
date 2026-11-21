function claude-plugin-test --description 'Run a mod\'s tests on the toolbox Claude Code binary'
    # The toolbox wrapper puts --settings before `plugin`, which `plugin test` rejects.
    set -l root ~/.toolbox/tools/claude-code
    set -l current (python3 -c "import json,sys;print(json.load(open(sys.argv[1]))['CurrentVersion']['Version'])" $root/info.json)
    or return 1
    $root/$current/claude plugin test $argv
end
