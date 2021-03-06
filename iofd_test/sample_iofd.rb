require './iofd_test/test_core.rb'

set_cmd "sample.rb"

iofd "test" do |iofd|
    iofd.io_contents = [
        { output: "what action: ", input: "plus" },
        { output: "a: ", input: "5" },
        { output: "b: ", input: "-6" },
        { output: "a+b: -1", input: nil }
    ]
    iofd
end

iofd "new_file_eq" do |iofd|
    test_file = "sample_data/output_files/test_file.output"
    iofd.io_contents = [
        { output: "what action: ", input: "mkfile" },
        { output: "file name: ", input: "test_file" },
    ]
    iofd.files = [
        { original: test_file, comparison: "iofd_test/comparison_files/new_file.txt" }
    ]
    iofd
end

iofd "new_file_eq2" do |iofd|
    test_file = "new_file.txt"
    from_file = "iofd_test/file_data/new_file.txt"
    comparison_file = "iofd_test/comparison_files/new_file.txt"
    iofd.file_data_in_test = [ { from: from_file, to: test_file } ] 
    iofd.io_contents = [
        { output: "what action: ", input: "mkfile" },
        { output: "file name: ", input: "test_file" },
    ]
    iofd.files = [
        { original: test_file, comparison: comparison_file }
    ]
    iofd
end

iofd "change_file_eq" do |iofd|
    iofd.io_contents = [
        { output: "what action: ", input: "chfile" },
        { output: "change: ", input: "change" },
    ]
    iofd.files = [
        { original: "sample_data/change_file", comparison: "iofd_test/comparison_files/change_file.txt" }
    ]
    iofd
end

iofd "remove_file" do |iofd|
    remove_file_path = "sample_data/remove_file"
    iofd.io_contents = [
        { output: "what action: ", input: "rmfile" },
        { output: "remove file: ", input: remove_file_path },
    ]
    iofd.remove_files = [remove_file_path]
    iofd
end

iofd "create_directory" do |iofd|
    test_dir = "test_dir"
    iofd.io_contents = [
        { output: "what action: ", input: "mkdir" },
        { output: "directory name: ", input: test_dir }
    ]
    iofd.directories = [test_dir]
    iofd
end

iofd "remove_directory" do |iofd|
    remove_dir = "sample_data/remove_directory"
    iofd.io_contents = [
        { output: "what action: ", input: "rmdir" },
        { output: "directory name: ", input: remove_dir }
    ]
    iofd.remove_directories = [remove_dir]
    iofd
end

iofd "outputs" do |iofd|
    iofd.io_contents = [
        { output: "what action: ", input: "outputs" },
        { output: "good", input: nil },
        { output: "good", input: nil }
    ]
    iofd
end

iofd "io_test" do |iofd|
    iofd.io_contents = [
        { output: "what action: ", input: "io" },
        { output: "input: ", input: "st" },
        { output: "st", input: nil },
        { output: "st", input: nil },
        { output: "input again: ", input: "st2" },
        { output: "st2", input: nil },
        { output: "st2", input: nil }
    ]
    iofd
end

iofd "plus_with_blank" do |iofd|
    iofd.io_contents = [
        { output: "what action: ", input: "plus_with_blank" },
        { input: "3 7" },
        { output: "10" }
    ]
    iofd
end

iofd "should fail test without infinite loop" do |iofd|
    iofd.io_contents = [
        { output: "what action: ", input: "plus_with_blank" },
        { output: "10" }
    ]
    iofd
end
