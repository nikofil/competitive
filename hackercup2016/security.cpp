#include <iostream>
#include <algorithm>
#include <vector>
#include <cstdio>
#include <cstdint>

using namespace std;

int64_t n,r;
string a[2];

bool inline isw(int ai, int x) {
    return (x < 0 || x >= n || a[ai][x] == 'X');
}

void dow(int ai, int x) {
    a[ai][x] = a[ai][x]=='X'?'X':'#';
    a[1-ai][x] = a[1-ai][x]=='X'?'X':'*';
    int i = x+1;
    while (i < n && a[ai][i] != 'X') a[ai][i++] = '*';
    i = x-1;
    while (i >= 0 && a[ai][i] != 'X') a[ai][i--] = '*';
    r++;
}

int main() {
    int cases, cc = 1;
    cin >> cases;
    while (cases--) {
        r = 0;
        cin >> n;
        cin >> a[0] >> a[1];
        
        for (int ai = 0; ai < 2; ai++) {
            for (int x = 0; x < n; x++) {
                if (a[ai][x] == '.' && isw(ai, x+1) && isw(ai, x-1))
                    dow(1-ai, x);
            }
        }

        for (int ai = 0; ai < 2; ai++) {
            for (int x = 0; x < n; x++) {
                if (a[ai][x] == '.')
                    dow(ai, x);
            }
        }

        cout << "Case #" << cc++ << ": " << r << endl;
    }
}