#include <iostream>
#include <algorithm>
#include <vector>
#include <cstdio>
#include <cstdint>

using namespace std;

int main() {
    int cases, cc = 1;
    cin >> cases;
    while (cases--) {
        uint64_t i, n, m, len = 0, sc = 0, best = 0;
        cin >> n >> m;
        vector<int> v(n);
        for (i = 0; i < n; i++) {
            cin >> v[i];
        }
        for (i = 0; i < n; i++) {
            while (i+len < n && sc + v[i+len] <= m) {
                sc += v[i+len];
                len++;
            }
            best += len;
            if (len > 0) {
                len--;
                sc -= v[i];
            }
        }
        cerr << "done" << cc << endl;
        cout << "Case #" << cc++ << ": " << best << endl;
    }
}