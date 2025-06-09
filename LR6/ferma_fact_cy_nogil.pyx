from libc.math cimport sqrt

cpdef bint is_perfect_square_cy(long n) nogil:
    cdef long root = <long>sqrt(n)
    return root * root == n

cpdef tuple fermat_factorization_cy(long N):
    cdef long x, y_squared, y
    if N % 2 == 0:
        return (2, N // 2)

    with nogil:
        x = <long>sqrt(N) + 1
        while True:
            y_squared = x * x - N
            if is_perfect_square_cy(y_squared):
                y = <long>sqrt(y_squared)
                break
            x += 1

    return (x - y, x + y)
