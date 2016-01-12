#include <iostream>
#include <algorithm>
#include <vector>
#include <cstdio>

using namespace std;

int main() {
    // freopen("in.txt", "r", stdin);

    int cases, cc = 1;
    cin >> cases;
    while (cases--) {
        int num;
        long r = 0;
        cin >> num;
        vector< pair<int,int> > v(num);
        vector< vector<int> > d(num);
        for (int i = 0; i < num; i++) {
            int x, y;
            cin >> x >> y;
            v[i] = pair<int, int>(x,y);
            auto& p = v[i];
            d[i] = vector<int>(num);

            for (int l = 0; l <= i; l++) {
                auto& p2 = v[l];
                int dx = p.first - p2.first;
                int dy = p.second - p2.second;
                int dd = dx*dx + dy*dy;
                d[i][l] = d[l][i] = dd;
            }
        }

        for (auto& vv : d) {
            sort(vv.begin(), vv.end());
            long cur = 0;
            for (int i = 0; i < num-1; i++) {
                if (vv[i] == vv[i+1])
                    cur++;
                else {
                    r += cur*(cur+1)/2;
                    cur = 0;
                }
            }
            r += cur*(cur+1)/2;
        }
        for (auto a : d) {
            for (auto b : a)
                cerr << b << " ";
            cerr << endl;
        }
        cout << "Case #" << cc++ << ": " << r << endl;
    }
}