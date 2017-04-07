(loop [total (read-string (read-line)) cur 1]
    (printf "Case #%d: 1\n" cur)
    (if (< cur total)
        (recur total (+ cur 1))
    )
)
