from libc.math cimport sqrt
cdef extern from "math.h":
    int isqrt(int)

cpdef bint is_perfect_square_cy(long n):
    cdef long root = <long>sqrt(n)
    return root * root == n

cpdef tuple fermat_factorization_cy(long N):
    cdef long x, y_squared, y
    if N % 2 == 0:
        return (2, N // 2)
    x = <long>sqrt(N) + 1
    while True:
        y_squared = x * x - N
        if is_perfect_square_cy(y_squared):
            y = <long>sqrt(y_squared)
            return (x - y, x + y)
        x += 1
