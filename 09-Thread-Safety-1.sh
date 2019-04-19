source "${TEST_DIR}/funcs.bash"

test_start "Thread Safety" \
    "Performs allocations across multiple threads in parallel"

# If this crashes or times out, your allocator is not thread safe!
LD_PRELOAD=./allocator.so tests/progs/thread-safety

test_end
