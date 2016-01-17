#include <iostream>
#include <cstdint>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    int cases, icase;
    cin >> cases;
    uint64_t *when = new uint64_t[1000000], *delay = new uint64_t[100000];
    for (icase = 1; icase <= cases; icase++) {
        uint64_t i, L, M, N, D, lo, hi, mid, tmp, j, k;
        cin >> L >> N >> M >> D;
        for (i = 0; i < N; i++)
            cin >> delay[i];
        lo = 0;
        hi = 10000000000000000;
        while (lo <= hi) {
            mid = (hi+lo) / 2;
            tmp = 0;
            for (i = 0; i < N; i++) {
                tmp += mid/delay[i];
                if (tmp > L)
                    break;
            }
            if (tmp < L)
                lo = mid+1;
            else
                hi = mid-1;
        }
        lo--;
        do {
            lo++;
            tmp = 0;
            for (i = 0; i < N; i++) {
                tmp += lo/delay[i];
                if (tmp >= L)
                    break;
            }
        } while (tmp < L);
        j = 0;
        for (k = 0; k < N; k++) {
            for (i = delay[k]; i <= lo; i += delay[k])
                when[j++] = i;
        }
        sort(when, &when[j]);
        for (i = 0; i < L; i++) {
            // cerr << when[i] << " ";
            if (i < M)
                when[i] += D;
            else if (when[i] >= when[i-M])
                when[i] += D;
            else
                when[i] = when[i-M] + D;
        }
        // cerr << endl;
        cout << "Case #"<<icase<<": "<< when[L-1] << endl;
    }
    return 0;
}