source "${TEST_DIR}/funcs.bash"

test_start "ls /" \
    "Runs 'ls /' with custom memory allocator"

expected=$(ls /)
actual=$(LD_PRELOAD=./allocator.so ls /) || test_end

compare <(echo "${expected}") <(echo "${actual}")

test_end
