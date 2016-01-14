#include <iostream>
#include <cstdint>
#include <vector>
using namespace std;

int poss(vector< pair<uint64_t, uint64_t> > &v, uint64_t q) {
    for (pair<uint64_t, uint64_t> &p : v) {
        auto qq = (q * p.first + 99) / 100;
        auto qq2 = (q * (p.first+1) + 99) / 100;
        auto pp = p.second;
        if (pp < qq)
            return -1;
        else if (pp >= qq2)
            return 1;
    }
    return 0;
}


int main() {
    int cases;
    cin >> cases;
    for (int aa = 1; aa <= cases; aa++) {
        uint64_t c, from=0, to=10000000000000000L;
        int64_t res = -1;
        cin >> c;
        vector< pair<uint64_t, uint64_t> > v(c);
        for (int i = 0; i < c; i++) {
            uint64_t p, f;
            cin >> p >> f;
            v[i] = pair<uint64_t, uint64_t>(p, f);
            if (p == 100)
                res = f;
        }
        if (res == -1) {
        uint64_t mid;
        while (from <= to) {
            mid = (to+from) / 2;
            auto pos = poss(v, mid);
            if (pos < 0)
                to = mid - 1;
            else if (pos > 0)
                from = mid + 1;
            else
                break;
        }
        cerr << "Case " << aa << " " << from << " " << to << " " << poss(v, mid+1)<<poss(v, mid-1)<<endl;
        if (from <= to && poss(v, mid+1)*poss(v, mid-1) != 0)
            res = mid;
        else
            res = -1;
        }
        cout << "Case #"<<aa<<": "<<res<<endl;
    }
    return 0;
}
