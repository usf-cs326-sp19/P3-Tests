source "${TEST_DIR}/funcs.bash"

expected_order=$(cat <<EOM
0
1
2
3
4
5
6
EOM
)

test_start "Basic Worst Fit"

output=$( \
    ALLOCATOR_ALGORITHM=worst_fit \
    tests/progs/allocations-1 2> /dev/null)

echo "${output}"

# Just get the block ordering from the output. We ignore the last allocation
# that is caused by printing to stdout.
block_order=$(grep '\[BLOCK\]' <<< "${output}" \
    | sed 's/.*(\([0-9]*\)).*/\1/g' \
    | head --lines=-1)

compare <(echo "${expected_order}") <(echo "${block_order}") || test_end

test_end
