function RunJavaProgram()
    local filename = vim.fn.expand("%:p")
    vim.fn.fnamemodify(filename, ":t:r")

    if filename:match("%.java$") then
        local compile_command = "javac " .. filename .. " 2> output.txt"
        vim.fn.system(compile_command)
        if vim.v.shell_error == 0 then
            local class_name = vim.fn.fnamemodify(filename, ":t:r")
            local run_command = 'ulimit -t 60 && (java ' .. class_name .. ' > output.txt 2>&1 || echo "TLE" > output.txt)'
            vim.fn.system(run_command)
        else
            print("Compilation failed")
        end
        vim.fn.system('tmux send-keys -t 2 ":e" Enter')
        vim.fn.system('tmux send-keys -t 2 "nvim output.txt" Enter')
    else
        print("Current file is not a Java source file.")
    end
end

vim.api.nvim_command("command! ComJava lua RunJavaProgram()")

